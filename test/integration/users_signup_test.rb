require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	def setup
		puts "%USERS_SIGNUP_TEST-I-SETUP, running setup method..."
	end

	def teardown
		puts "%USERS_SIGNUP_TEST-I-TEARDOWN, running setup method..."
	end

	test "invalid signup information" do
		get signup_path
		assert_no_difference 'User.count' do
			post users_path, user: {
				name:                  "",
				email:                 "test@example.com",
				password:              "xxxxxxxx",
				password_confirmation: "xxxxxxxx"
			}
		end
		# Check route, action and view.
		assert_template 'users/new'
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: {
				name:                  "Test User",
				email:                 "test@example.com",
				password:              "xxxxxxxx",
				password_confirmation: "xxxxxxxx"
			}
		end
		# Check route, action and view.
		assert_template 'users/show'
	end

end
