require 'rake'

#Set environment to 'test'
ENV['ENVIRONMENT'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

#Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

#Tell Capybara to talk to Chat
Capybara.app = Chat

#Load the RakeFile
Rake.application.load_rakefile
Rake::Task['default'].execute

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
  # config.before(:each) do
  #   Rake::Task['test_database_setup'].execute
  # end
  #
  # config.expect_with :rspec do |expectations|
  #
  #   expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  # end
  # config.mock_with :rspec do |mocks|
  #
  #   mocks.verify_partial_doubles = true
  # end
  # config.shared_context_metadata_behavior = :apply_to_host_groups
end
