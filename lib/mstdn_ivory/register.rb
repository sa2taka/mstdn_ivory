require 'oauth2'

module MstdnIvory
  module Register
    def create_app(name, scopes = 'read', redirect_uri = 'urn:ietf:wg:oauth:2.0:oob', website = nil)
      request(:post, '/api/v1/apps', form: { client_name: name, redirect_uris: redirect_uri, scopes: scopes, website: website })
    end
  end
end
