# encoding: utf-8

require 'bundler/setup'
Dir["./tasks/**/*.rake"].each { |f| load f }

task :environment do
  require "./config/environment"
  require "./lib/models"
  require './lib/services'
end

begin
  desc 'Interactive console'
  task :console do
    exec "irb -r ./config/environment -r ./lib/models"
  end
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

namespace :assets do
  desc 'Precompile assets'
  task :precompile => :clean do
    require 'coffee_script'
    require 'sprockets'
    require 'sprockets-urlrewriter'
    require 'uglifier'
    env = Sprockets::Environment.new
    env.append_path 'assets/js'
    env.append_path 'assets/css'
    env.append_path 'vendor/assets'
    env.js_compressor = Uglifier.new
    env.register_preprocessor 'text/css', Sprockets::UrlRewriter
    Dir.mkdir './public/assets' unless Dir.exists? './public/assets'
    File.open('./public/assets/site.css', 'w') { |f| f.write env['site.css']}
    File.open('./public/assets/application.js', 'w') { |f| f.write env['application.js']}

    Dir['{vendor,.}/assets/**/*.{png,jpg,gif}'].each do |i|
      path = i.sub(/^\w*\/\w*\/(.*)$/, 'public/assets/\1')
      FileUtils.mkdir_p File.dirname path
      FileUtils.cp i, path
    end
  end

  task :clean do
    FileUtils.rm_rf 'public/assets'
  end
end
