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
      {
        accept: '*/*',
        user_agent:'mstdn ivory',
        authorization: "Bearer #{@token}"
      }
    end
  end
end
