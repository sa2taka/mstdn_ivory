require 'mstdn_ivory/api'

module MstdnIvory
  class Client
    include Api

    attr_accessor :token
    attr_reader :base_url

    def initialize(base_url, token = '')
      @base_url = base_url
      @token = token
    end

    def headers
      { authorization: "Bearer #{@bearer_token}" }
    end
  end
end
