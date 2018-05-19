require 'addressable/uri'
require 'socket'
require 'http/request'
require 'openssl'

module MstdnIvory
  module Stream
    def stream(path, options = {}, &block)
      request(:get, path, options, &block)
    end

    def request(method, path, params)
      uri = Addressable::URI.parse(self.base_url + path)

      request = HTTP::Request.new(verb: method, uri: uri + '?' + to_url_params(params), headers: self.headers)

      client = connect(request)

      while (body = client.readpartial(4096))
        yield(body)
      end

    end

    def connect(request)
      client = TCPSocket.open(request.socket_host, request.socket_port)

      ssl_client = OpenSSL::SSL::SSLSocket.new(client)
      ssl_client.connect

      request.stream(ssl_client)

      ssl_client
    end

    def to_url_params(params)
      work = Addressable::URI.new
      work.query_values = params
      work.query
    end
  end
end
