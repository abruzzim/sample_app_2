require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
  	puts "%USERS_CONTROLLER_TEST-I-SETUP, running setup method..."
	  @base_title = "Ruby on Rails 4.2.0 Tutorial Sample App"
  end

  def teardown
  	puts "%USERS_CONTROLLER_TEST-I-TEARDOWN, running teardown method..."
  	@base_title = nil
  end

  test "%USERS_CONTROLLER_TEST-I-ACTION, should get New method" do
    get :new
    assert_response :success
    assert_select "title", "Sign Up | #{@base_title}"
  end

end
