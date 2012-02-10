require 'spec_helper'

describe "RSpec Configuration" do
  describe "configuring Capybara without Cucumber" do
    it "should not set the driver to selenium_with_firebug by default" do
      Capybara.current_driver.should_not == :selenium_with_firebug
    end

    it "should set the driver to selenium_with_firebug when tagged", :firebug => true do
      Capybara.current_driver.should == :selenium_with_firebug
    end
  end
end
