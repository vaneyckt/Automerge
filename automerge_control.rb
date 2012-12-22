require 'daemons'

# http://daemons.rubyforge.org/classes/Daemons.html#M000005
pwd = Dir.pwd
Daemons.run_proc('automerge') do
  Dir.chdir(pwd)
  exec "ruby automerge.rb"
end
