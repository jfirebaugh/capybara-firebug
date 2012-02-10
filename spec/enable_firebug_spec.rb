require 'spec_helper'

describe Selenium::WebDriver::Firefox::Profile do
  before { described_class.firebug_version = nil } # Reset

  describe ".firebug_version" do
    it "defaults to 1.9.1" do
      described_class.firebug_version.should == "1.9.1"
    end

    it "can be explicitly set" do
      described_class.firebug_version = '1.7.0'
      described_class.firebug_version.should == "1.7.0"
    end
  end

  describe "#enable_firebug" do
    it "adds the Firebug extension" do
      subject.should_receive(:add_extension).with(/firebug-1\.9\.1\.xpi$/)
      subject.enable_firebug
    end

    it "honors the configured version" do
      Selenium::WebDriver::Firefox::Profile.firebug_version = '1.6.2'
      subject.should_receive(:add_extension).with(/firebug-1\.6\.2\.xpi$/)
      subject.enable_firebug
    end

    it "accepts an optional version argument" do
      subject.should_receive(:add_extension).with(/firebug-1\.7\.0\.xpi$/)
      subject.enable_firebug("1.7.0")
    end
  end
end
