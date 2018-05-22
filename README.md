# MstdnIvory

Ruby interface for Mastodon api, like mastodon-api npm package

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mstdn_ivory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mstdn_ivory

## Usage

#### authorization
For getting access token(and creating app):

```ruby
require 'mstdn_ivory'

client = MstdnIvory::Client.new('baseurl(e.g. https://mstdn-workers.com)')
res = client.create_app('app name',
                        'scopes(e.g. read write follow, default scope is read)',
                        'redirect_uri, default is urn:ietf:wg:oauth:2.0:oob',
                        'website name, default is nil')
res.client_id # => 'Your client id'
res.client_secret # => 'Your client secret'

auth_url = client.create_authorization_url(res.client_id,
                                          res.client_secret,
                                          'Your client scopes',
                                          'redirect_uri, default is urn:ietf:wg:oauth:2.0:oob')
auth_url #=> 'https://mstdn-workers.com/oauth/authorize...'

# You got authorization_code in some way
token = client.get_access_token(res.client_id,
                                res.client_secret,
                                'Your authorization code',
                                'redirect_uri, default is urn:ietf:wg:oauth:2.0:oob')
token #=> 'Your access token'

client.get('/api/v1/accounts/424') # => Information of my accounts(If there is in mstdn-workers.com)
```

If you already have access token, you can easily create client:

```ruby
client = MstdnIvory::Client.new('baseurl', 'Your access token')
client.get('/api/v1/accounts/424') # => Information of my accounts
```

#### examples

You can get, post and stream method using client.

For example, Reading the home timeline:

```ruby
client.get('/api/v1/timelines/home')
```

Post status:
```ruby
client.post('/api/v1/statuses', {'status': 'status content'})
```

Streaming the home timeline([Read](https://github.com/tootsuite/documentation/blob/master/Using-the-API/Streaming-API.md) about streaming event and data):
```ruby
client.stream('/api/v1/streaming/user') do |event, data|
  p event
  p data
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sa2taka/mstdn_ivory. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MstdnIvory project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sa2taka/mstdn_ivory/blob/master/CODE_OF_CONDUCT.md).
