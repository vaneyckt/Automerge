Gem::Specification.new do |s|
  s.name        = 'automerge'
  s.version     = '1.0.0'
  s.date        = '2012-09-23'
  s.summary     = "A Ruby application that automatically merges the Github pull requests of a given user."
  s.description = "A Ruby application that automatically merges the Github pull requests of a given user."
  s.authors     = ["Tom Van Eyck"]
  s.email       = 'tomvaneyck@gmail.com'
  s.homepage    = 'https://github.com/vaneyckt/Automerge'

  s.add_runtime_dependency 'octokit', '>= 1.14.0'
end
