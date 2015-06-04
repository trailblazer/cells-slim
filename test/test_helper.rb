require 'minitest/autorun'

ENV['RAILS_ENV'] = 'test'

require 'cells/slim'
require_relative 'dummy/config/environment'
require "rails/test_help" # adds stuff like @routes, etc.

# Cell::ViewModel.send :include, Cell::Slim