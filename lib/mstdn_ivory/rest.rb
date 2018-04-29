module MstdnIvory
  module Rest
    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params)
    end
  end
end
