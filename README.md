capybara-firebug provides a dead-simple way to run Capybara-based Cucumber
scenarios or RSpec request specs with Firebug enabled under the selenium driver.

## RSpec

To use it in RSpec examples, `require 'capybara/firebug/rspec'` in spec_helper.rb,
and tag the examples you need to debug with `:firebug => true`.

## Cucumber

To use it in Cucumber scenarios, `require 'capybara/firebug/cucumber'` in env.rb,
and tag the scenarios you need to debug with `@firebug`.

You'll want to be able to pause the scenario at some point to inspect things
in Firebug. A step definition for `Then stop and let me debug` is provided
for this purpose. When executed, it breaks in the Ruby debugger. (If you are
using bundler, you will also need to specify the correct debugging gem in your
Gemfile: `gem 'ruby-debug'` for 1.8, `gem 'ruby-debug19'` for 1.9.)

## Firebug Versions

By default, this gem uses Firebug 1.12.4, which is compatible with Firefox 23-25.

If you want to use Firebug 1.7.3 (compatible with Firefox 3.6, 4, and 5), 1.9.2
(compatible with Firefox 6-13), 1.10.6 (compatible with Firefox 13-18), or 1.11.0 (compatible with Firefox 17-22), you
need to explicitly specify the firebug_version setting in your `capybara.rb`
support file:

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

## Upgrading from 1.x

Cucumber and RSpec support has been split into separate files. You'll need to change
spec_helper.rb to `require 'capybara/firebug/rspec'` or env.rb to `require 'capybara/firebug/cucumber'`.
