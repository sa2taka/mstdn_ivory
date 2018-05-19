require 'mstdn_ivory/api'

module MstdnIvory
  class Client
    include Api

    attr_accessor :token
    attr_reader :base_url
    attr_reader :timeout

    DEFAULT_TIMEOUT = { connect: 2, read: 5, write: 20 }

    def initialize(base_url, token = '', options = {})
      @base_url = base_url
      @token = token
      @timeout = DEFAULT_TIMEOUT.merge(options[:timeout] || {})
    end

    def headers
      {
        accept: '*/*',
        user_agent:'mstdn ivory',
        authorization: "Bearer #{@token}"
      }
    end
  end
end

client = MstdnIvory::Client.new('https://mstdn-workers.com', '1dfdee8ae81c8f1b8af463c7460d777d6870fd1acc6470443c468cea4965ca58').stream('/api/v1/streaming/public') do |body|
  puts body
end
