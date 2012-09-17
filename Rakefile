#!/usr/bin/env rake
require "bundler/gem_tasks"

task :default => :test
task :spec => :test
task :test do
  # There is a bug with the rspec command and Gosu that causes a segfault.
  # This is my hack to work around it
  if ARGV.size == 1
    ARGV = Dir['spec/**_spec.rb']
  else
    ARGV.shift
  end
  require 'rspec/autorun'
end
