require 'http'
require 'oj'
require 'mstdn_ivory/dot_accessable_hash'

module MstdnIvory
  module Request
    def request(method, path, options)
      request_url = self.base_url + path

      http_client = HTTP.timeout(:per_operation, connect: self.timeout[:connect], read: self.timeout[:read], write: self.timeout[:write])
      res = http_client.headers(self.headers).public_send(method, request_url, {form: options})
      # Change Hash to DotAccessableHash
      json_data = Oj.load(res)
      case json_data
      when Array
        json_data.map { |elm| MstdnIvory::DotAccessableHash.new.merge(elm) }
      when Hash
        MstdnIvory::DotAccessableHash.new.merge(json_data)
      end
    end
  end
end
