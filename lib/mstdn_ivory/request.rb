require 'http'
require 'oj'
require 'mstdn_ivory/dot_accessable_hash'

module MstdnIvory
  module Request
    def request(method, path, options)
      request_url = self.base_url + path

      res = HTTP.headers(self.headers).public_send(method, request_url, options)
      # Change Hash to DotAccessableHash
      MstdnIvory::DotAccessableHash.new.merge(Oj.load(res))
    end
  end
end
