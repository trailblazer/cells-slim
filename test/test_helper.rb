require 'minitest/autorun'

ENV['RAILS_ENV'] = 'test'

require_relative 'dummy/config/environment'
require "rails/test_help" # adds stuff like @routes, etc.

require 'cell/slim'

# Cell::ViewModel.send :include, Cell::Slim