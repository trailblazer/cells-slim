begin
  require 'byebug'
rescue LoadError
end
require 'minitest/autorun'

require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new]

ENV['RAILS_ENV'] = 'test'

require 'cells/slim'
require_relative 'dummy/config/environment'
require "rails/test_help" # adds stuff like @routes, etc.

