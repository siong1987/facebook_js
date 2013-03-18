$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "facebook_js/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "facebook_js"
  s.version     = FacebookJs::VERSION
  s.authors     = ["Teng Siong Ong"]
  s.email       = ["siong1987@gmail.com"]
  s.homepage    = "http://www.github.com/siong1987/facebook_js"
  s.summary     = "facebook_js helps to keep all the unnecessary editing from using Facebook JS SDK."
  s.description = "facebook_js helps to keep all the unnecessary editing from using Facebook JS SDK."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0.beta1"
end
