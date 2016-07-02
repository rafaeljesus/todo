require 'bundler/setup'
require 'yaml'
require 'mongoid'
require 'praxis'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

# $LOAD_PATH.unshift File.expand_path '../../app', __FILE__
mongo_file = File.expand_path '../../config/mongoid.yml', __FILE__

Bundler.setup :default, :test

Mongoid.load!(mongo_file, ENV['RACK_ENV'])

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.order = :random

  def app
    Rack::Builder.parse_file('config.ru').first
  end

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
