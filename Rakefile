#!/usr/bin/env rake
require "bundler/gem_tasks"

task :test do
  # There is a bug with the rspec command and Gosu that causes a segfault.
  # This is my hack to work around it
  ARGV.shift
  require 'rspec/autorun'
end
