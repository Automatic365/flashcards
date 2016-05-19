# require 'simplecov'
# SimpleCov.start
# SimpleCov.command_name

require "rake"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  #t.verbose = true
end

task default: :test
