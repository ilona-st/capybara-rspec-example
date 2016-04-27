require 'bundler'
Bundler.setup

require 'pry'
require 'capybara/rspec'
# require 'capybara/poltergeist'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Capybara.default_driver = :poltergeist
Capybara.default_driver = :chrome
