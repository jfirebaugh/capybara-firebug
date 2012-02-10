When /^I visit "([^"]+)"$/ do |page|
  visit(page)
end

Then /^I should be on "([^"]+)"$/ do |page|
  current_url.should == page
end

Then /^Firebug should be active$/ do
  evaluate_script('!!(window.console && (window.console.firebug || window.console.exception))').should be_true
end
