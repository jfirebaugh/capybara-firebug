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

## Using Firefox 4 and Firebug 1.7.0

If you want to use Firefox 4 with Firebug 1.7.0, configure the firebug_version
setting in your `capybara.rb` support file

    # located in features/support/capybara.rb or similar
    require 'capybara/firebug'
    Selenium::WebDriver::Firefox::Profile.firebug_version = '1.7.0'

## Using Firefox 5 and Firebug 1.7.3

If you want to use Firefox 5 you should update selenium-webdriver gem (~> 0.2.2) and set firebug_version to 1.7.3

    # located in features/support/capybara.rb or similar
    require 'capybara/firebug'
    Selenium::WebDriver::Firefox::Profile.firebug_version = '1.7.3'

## Customizing the Profile

If you wish to further customize the Firefox profile used by selenium, you
can use the `#enable_firebug` method to add the Firebug extension to it:

    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.enable_firebug

This can also be used to enable Firebug on a remote browser:

    Capybara::Driver::Selenium.new(app,
       :browser => :remote,
       :url => "http://my.ip.add.ress:4444/wd/hub",
       :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile))
