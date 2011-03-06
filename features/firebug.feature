Feature: @firebug tag
  As a developer
  I want to tag my scenarios with @firebug
  So I can use Firebug to debug failures

  @firebug
  Scenario: A scenario with the @firebug tag
    When I visit "http://rubygems.org/"
    Then I should be on "http://rubygems.org/"
    And Firebug should be active
    Then stop and let me debug
