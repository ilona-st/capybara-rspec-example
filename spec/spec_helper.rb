require 'bundler'
Bundler.setup

require 'pry'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :chrome

Capybara.default_max_wait_time

module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end

Dir["#{File.expand_path("../support", __FILE__)}/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include WaitForAjax, type: :feature
  config.include AuthenticationMacros, type: :feature
end
