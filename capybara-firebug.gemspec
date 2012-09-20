# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "capybara-firebug"
  s.version     = "1.2.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John Firebaugh"]
  s.email       = ["john.firebaugh@gmail.com"]
  s.homepage    = "https://github.com/jfirebaugh/capybara-firebug"
  s.summary     = %q{Run selenium with Firebug enabled}
  s.description = %q{Provides a dead-simple way to run scenarios with Firebug
enabled under the selenium driver.}

  s.rubyforge_project = "capybara-firebug"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "capybara", ">= 1.0"

  s.add_development_dependency "rspec", "~> 2.0"
  s.add_development_dependency "cucumber", "~> 0.10.0"
end
