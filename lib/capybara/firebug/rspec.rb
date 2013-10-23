require 'capybara/firebug'

RSpec.configure do |config|
  config.before(:each, :firebug => true) do
    Capybara.current_driver = :selenium_with_firebug
  end
end
