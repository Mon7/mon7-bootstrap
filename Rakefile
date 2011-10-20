require 'bundler/setup'
Dir["./tasks/**/*.rake"].each { |f| load f }

task :environment do
	require "./config/environment"
	require "./lib/models"
end

task :console do
	exec "pry -r ./config/environment -r ./lib/models"
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = ['--color --format documentation']
  end
  task :default => :spec
rescue LoadError
end

