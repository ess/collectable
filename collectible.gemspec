$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "collectable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "collectable"
  s.version     = Collectable::VERSION
  s.authors     = ["Dennis Walters"]
  s.email       = ["pooster@gmail.com"]
  s.homepage    = "http://github.com/ess/collectable"
  s.summary     = "Make PORO models work with collection_check_boxes"
  s.description = "Make PORO models work with collection_check_boxes"
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "README.md"]

  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rspec"
end
