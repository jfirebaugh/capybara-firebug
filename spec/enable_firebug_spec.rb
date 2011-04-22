require 'spec_helper'

describe Selenium::WebDriver::Firefox::Profile do
  describe ".firebug_version" do
    subject { described_class.firebug_version }

    it "defaults to 1.6.2" do
      should == "1.6.2"
    end

    context "when set" do
      before { described_class.firebug_version = requested_version }

      let(:requested_version) { '1.7.0' }

      it { should == requested_version }
    end
  end

  describe "#enable_firebug" do
    before { Selenium::WebDriver::Firefox::Profile.firebug_version = nil }

    it "adds the Firebug extension" do
      subject.should_receive(:add_extension).with(/firebug-1\.6\.2\.xpi$/)
      subject.enable_firebug
    end

    it "honors the configured version" do
      Selenium::WebDriver::Firefox::Profile.firebug_version = '1.7.0'
      subject.should_receive(:add_extension).with(/firebug-1\.7\.0\.xpi$/)
      subject.enable_firebug
    end

    it "accepts an optional version argument" do
      subject.should_receive(:add_extension).with(/firebug-1\.7\.0\.xpi$/)
      subject.enable_firebug("1.7.0")
    end
  end
end
