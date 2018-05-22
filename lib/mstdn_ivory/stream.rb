require 'addressable/uri'
require 'socket'
require 'http/request'
require 'openssl'
require 'mstdn_ivory/parser'

module MstdnIvory
  module Stream
    def stream(path, options = {}, &block)
      stream_request(:get, path, options, &block)
    end

    def stream_request(method, path, params, &block)
      uri = Addressable::URI.parse(self.base_url + path)

      request = HTTP::Request.new(verb: method, uri: uri + '?' + to_url_params(params), headers: self.headers)

      client = connect(request)

      parser = MstdnIvory::Parser.new(&block)

      while (body = client.readpartial(4096))
        parser << body
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
