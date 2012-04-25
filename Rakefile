require 'rubygems'
require 'rake'

begin
  gem 'rubygems-tasks', '~> 0.1'
  require 'rubygems/tasks'

  Ore::Tasks.new
rescue LoadError => e
  STDERR.puts e.message
  STDERR.puts "Run `gem install rubygems-tasks` to install 'rubygems/tasks'."
end

begin
  gem 'rspec', '~> 2.4'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new
rescue LoadError => e
  task :spec do
    abort "Please run `gem install rspec` to install RSpec."
  end
end

task :test => :spec
task :default => :spec

begin
  gem 'yard', '~> 0.6.0'
  require 'yard'

  YARD::Rake::YardocTask.new  
rescue LoadError => e
  task :yard do
    abort "Please run `gem install yard` to install YARD."
  end
end
task :doc => :yard
