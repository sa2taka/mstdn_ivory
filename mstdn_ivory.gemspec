
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mstdn_ivory/version"

Gem::Specification.new do |spec|
  spec.name          = "mstdn_ivory"
  spec.version       = MstdnIvory::VERSION
  spec.authors       = ["sa2taka"]
  spec.email         = ["sa2taka@gmail.com"]

  spec.summary       = %q{Ruby binding for Mastodon api.}
  spec.description   = %q{Ruby binding for Mastodon api, like mastodon-api npm package}
  spec.homepage      = "https://github.com/sa2taka/mstdn_ivory"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
