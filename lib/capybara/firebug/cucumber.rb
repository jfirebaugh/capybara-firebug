require 'capybara/firebug'

Before '@firebug' do
  Capybara.current_driver = :selenium_with_firebug
end

Then /^stop and let me debug$/ do
  require 'ruby-debug'
  debugger
end
