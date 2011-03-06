When /^I visit "([^"]+)"$/ do |page|
  visit(page)
end

Then /^I should be on "([^"]+)"$/ do |page|
  current_url.should == page
end

Then /^Firebug should be active$/ do
  evaluate_script('window.console.firebug').should_not be_nil
end
