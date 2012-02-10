require 'selenium/webdriver'

class Selenium::WebDriver::Firefox::Profile
  def self.firebug_version
    @firebug_version ||= '1.9.1'
  end

  def self.firebug_version=(version)
    @firebug_version = version
  end

  def enable_firebug(version = nil)
    version ||= Selenium::WebDriver::Firefox::Profile.firebug_version
    add_extension(File.expand_path("../firebug-#{version}.xpi", __FILE__))

    # Prevent "Welcome!" tab
    self["extensions.firebug.currentVersion"] = "999"

    # Enable for all sites.
    self["extensions.firebug.allPagesActivation"] = "on"

    # Enable all features.
    ['console', 'net', 'script'].each do |feature|
      self["extensions.firebug.#{feature}.enableSites"] = true
    end

    # Closed by default.
    self["extensions.firebug.previousPlacement"] = 3
  end
end

Capybara.register_driver :selenium_with_firebug do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.enable_firebug
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end

if defined?(Cucumber::RbSupport)
  Before '@firebug' do
    Capybara.current_driver = :selenium_with_firebug
  end

  Then /^stop and let me debug$/ do
    require 'ruby-debug'
    debugger
  end
end

if defined?(RSpec::configure)
  RSpec.configure do |config|
    config.before(:each, :firebug => true) do
      Capybara.current_driver = :selenium_with_firebug
    end
  end
end
