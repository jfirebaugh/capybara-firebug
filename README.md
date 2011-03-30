capybara-firebug provides a dead-simple way to run scenarios with Firebug
enabled under the selenium driver.

1. Install the gem
2. `require 'capybara/firebug'` in env.rb
3. Tag a scenario with `@firebug`
4. Run it

Firebug will be set up so that all features are fully enabled on every page.

You'll want to be able to pause the scenario at some point to inspect things
in Firebug. A step definition for `Then stop and let me debug` is provided
for this purpose. When executed, it breaks in the Ruby debugger.

== Customizing the Profile ==

If you wish to further customize the Firefox profile used by selenium, you
can use the `#enable_firebug` method to add the Firebug extension to it:

    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.enable_firebug

This can also be used to enable Firebug on a remote browser:

    Capybara::Driver::Selenium.new(app,
       :browser => :remote,
       :url => "http://my.ip.add.ress:4444/wd/hub",
       :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile))
