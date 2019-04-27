$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "deep_state/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "deepstate-rails"
  spec.version     = DeepState::Rails::VERSION
  spec.authors     = ["Jamie Lawrence"]
  spec.email       = ["jamie@ideasasylum.com"]
  spec.homepage    = "https://github.com/ideasasylum/deepstate-rails"
  spec.summary     = "Rails integration for DeepState."
  spec.description = "Activerecord integration of DeepState machines."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.2", ">= 5.2.2.1"
  spec.add_dependency "deepstate"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry-rails"
end
