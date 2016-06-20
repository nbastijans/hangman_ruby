# frozen_string_literal: true
require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/test_*.rb'
end

RuboCop::RakeTask.new

task :default do
  Rake::Task[:test].invoke
  Rake::Task[:rubocop].invoke
end

task default: :test
