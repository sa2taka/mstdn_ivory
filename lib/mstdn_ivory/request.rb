require 'http'
require 'oj'

module MstdnIvory
  module Request
    def request(method, path, options)
      request_url = self.base_url + path

      res = HTTP.headers(self.headers).public(method, request_url, options_key: options)
      Oj.load(res)
    end
  end
end
