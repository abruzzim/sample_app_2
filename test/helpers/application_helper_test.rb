# Direct test for the full_title method in 
# app/helpers/application_helper.rb

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  	def setup
  		puts "%APPLICATION_HELPER_TEST-I-SETUP, running setup method..."
  	end

	test "full_title helper method" do
		assert_equal(full_title,          "Ruby on Rails 4.2.0 Tutorial Sample App")
		assert_equal(full_title("Test"),  "Test | Ruby on Rails 4.2.0 Tutorial Sample App")
	end
end
