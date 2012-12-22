Gem::Specification.new do |s|
  s.name        = 'automerge'
  s.version     = '1.0.1'
  s.date        = '2012-12-22'
  s.summary     = "A Ruby application that automatically merges the Github pull requests of a given user."
  s.description = "A Ruby application that automatically merges the Github pull requests of a given user."
  s.authors     = ["Tom Van Eyck"]
  s.email       = 'tomvaneyck@gmail.com'
  s.homepage    = 'https://github.com/vaneyckt/Automerge'

  s.add_runtime_dependency 'octokit', '>= 1.14.0'
  s.add_runtime_dependency 'daemons', '>= 1.1.9'
end
