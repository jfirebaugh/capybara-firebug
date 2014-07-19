capybara-firebug provides a dead-simple way to run Capybara-based Cucumber
scenarios or RSpec request specs with Firebug enabled under the selenium driver.

To use it in RSpec examples, `require 'capybara/firebug/rspec'` in spec_helper.rb,
and tag the examples you need to debug with `:firebug => true`.

To use it in Cucumber scenarios, `require 'capybara/firebug/cucumber'` in env.rb,
and tag the scenarios you need to debug with `@firebug`.

## Firebug Versions

By default, this gem uses Firebug 2.0.2, which is compatible with Firefox 30-32.

If you want to use Firebug 1.12.8 (compatible with Firefox 23+), you
need to explicitly specify the firebug_version setting in your `capybara.rb`
support file:

    # located in features/support/capybara.rb or similar
    require 'capybara/firebug'
    Selenium::WebDriver::Firefox::Profile.firebug_version = '1.12.8'

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

## Upgrading from 1.x

Cucumber and RSpec support has been split into separate files. You'll need to change
spec_helper.rb to `require 'capybara/firebug/rspec'` or env.rb to `require 'capybara/firebug/cucumber'`.

A "stop and let me debug" step definition is no longer provided. You can add it
yourself if needed:

```
Then /^stop and let me debug$/ do
  debugger
end
```

Ruby 1.8.x is no longer supported. Please upgrade to 2.0 or later.
