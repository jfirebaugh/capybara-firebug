capybara-firebug provides a dead-simple way to run Capybara-based Cucumber
scenarios or RSpec request specs with Firebug enabled under the selenium driver.

1. Install the gem
2. `require 'capybara/firebug'` in env.rb or spec_helper.rb
3. Tag the tests you need to debug:
  - Tag Cucumber scenarios with `@firebug`
  - Tag RSpec examples with `:firebug => true`
4. Run 'em

Firebug will be set up so that all features are fully enabled on every page.

You'll want to be able to pause the scenario at some point to inspect things
in Firebug. A step definition for `Then stop and let me debug` is provided
for this purpose. When executed, it breaks in the Ruby debugger. (If you are
using bundler, you will also need to specify the correct debugging gem in your
Gemfile: `gem 'ruby-debug'` for 1.8, `gem 'ruby-debug19'` for 1.9.)

## Firebug Versions

By default, this gem uses Firebug 1.9.1, which is compatible with Firefox 6-11.

If you want to use Firebug 1.7.3 (compatible with Firefox 3.6, 4, and 5), you
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
