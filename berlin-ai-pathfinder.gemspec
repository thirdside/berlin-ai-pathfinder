Gem::Specification.new do |s|
  s.name         = "berlin-ai-pathfinder"
  s.version      = '0.0.1'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Christian Blais"]
  s.email        = ["christ.blais@gmail.com"]
  s.homepage     = "http://github.com/thirdside/berlin-ai-pathfinder"
  s.summary      = "Berlin Artificial Intelligence Pathfinder"
  s.description  = "Berlin Artificial Intelligence Pathfinder"

  s.add_dependency 'berlin-ai'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-debugger'

  s.files = `git ls-files`.split("\n")

  s.require_paths = ['lib', 'test']
end
