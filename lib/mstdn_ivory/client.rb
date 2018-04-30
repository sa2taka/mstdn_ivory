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
