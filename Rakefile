require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = "--color --format doc"
  end
rescue LoadError
end


task :console do
  exec 'irb -r RbFreeBSD -I ./lib'
end

