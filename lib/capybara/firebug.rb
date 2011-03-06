require 'selenium/webdriver'

Capybara.register_driver :selenium_with_firebug do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.add_extension(File.expand_path("../firebug-1.6.2.xpi", __FILE__))

  # Prevent "Welcome!" tab
  profile["extensions.firebug.currentVersion"] = "999"

  # Enable for all sites.
  profile["extensions.firebug.allPagesActivation"] = "on"

  # Enable all features.
  ['console', 'net', 'script'].each do |feature|
    profile["extensions.firebug.#{feature}.enableSites"] = true
  end

  # Closed by default.
  profile["extensions.firebug.previousPlacement"] = 3

  Capybara::Driver::Selenium.new(app, :browser => :firefox, :profile => profile)
end

Before '@firebug' do
  Capybara.current_driver = :selenium_with_firebug
end

Then /^stop and let me debug$/ do
  require 'ruby-debug'
  debugger
end
