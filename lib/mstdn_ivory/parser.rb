require 'http'
require 'oj'

module MstdnIvory
  # This class parse stream data.
  class Parser
    def initialize(&block)
      @parser = HTTP::Parser.new(self)
      @buffer = {}
      @block = block
    end

    def <<(body)
      @parser << body
    end

    def on_body(data)
      if (match_data = data.match(/event: ([a-z]+)/))
        @buffer[:type] = match_data[1].to_sym
      elsif (match_data = data.match(/data: (.+)/m))
        @buffer[:data] = Oj.load(match_data[1])

        if @buffer[:type]
          @block.call(@buffer[:type], @buffer[:data])
        else
          @buffer = {}
        end
      end
    end
  end
end
