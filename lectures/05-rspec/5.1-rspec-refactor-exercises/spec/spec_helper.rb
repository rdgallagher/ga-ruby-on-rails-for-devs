# Simplecov must come first here
require 'simplecov'
SimpleCov.start

# Rest of spec helper now starts here
require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do

  require "rails/application"
  require File.expand_path("../../config/environment", __FILE__)

  require "rspec/rails"
  
  RSpec.configure do |config|
    config.mock_with :rspec
    config.expect_with :rspec
    config.after(:all) do
      puts "All tests have finished."
    end
  end
end

Spork.each_run do
  [ "support/config/*.rb", "support/*.rb" ].each do |path|
    Dir["#{File.dirname(__FILE__)}/#{path}"].each do |file|
      require file
    end
  end
end

