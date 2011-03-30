require 'spec_helper'

describe Selenium::WebDriver::Firefox::Profile, "#enable_firebug" do
  it "adds the Firebug extension" do
    subject.should_receive(:add_extension).with(/firebug-1\.6\.2\.xpi$/)
    subject.enable_firebug
  end

  it "accepts an optional version argument" do
    subject.should_receive(:add_extension).with(/firebug-1\.7\.0\.xpi$/)
    subject.enable_firebug("1.7.0")
  end
end
