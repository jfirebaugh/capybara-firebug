require 'capybara/firebug'

Before '@firebug' do
  Capybara.current_driver = :selenium_with_firebug
end
