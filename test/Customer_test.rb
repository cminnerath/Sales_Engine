require 'simplecov'            # => true
# SimpleCov.start
require 'minitest/autorun'     # => true
require 'minitest/pride'       # => true
require "../lib/sales_engine"  # ~> LoadError: cannot load such file -- ../lib/sales_engine



class CustomerTest < Minitest::Test

  def test_it_can_access_customers_first_name
    se_test = SalesEngine.new
    assert_equal "joey", se_test.start
  end

end

# >> Run options: --seed 36349
# >>
# >> # Running:
# >>
# >>
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.000741s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> LoadError
# ~> cannot load such file -- ../lib/sales_engine
# ~>
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/Turing/module1/week_5/Sales_Engine/test/Customer_test.rb:5:in `<main>'
