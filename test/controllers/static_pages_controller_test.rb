require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
  	puts "%STATIC_PAGES_CONTROLLER_TEST-I-SETUP, running setup method..."
	  @base_title = "Ruby on Rails 4.2.0 Tutorial Sample App"
  end

  def teardown
  	puts "%STATIC_PAGES_CONTROLLER_TEST-I-TEARDOWN, running teardown method..."
  	@base_title = nil
  end

  test "%STATIC_PAGES_CONTROLLER_TEST-I-HOME, should render Home Page" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "%STATIC_PAGES_CONTROLLER_TEST-I-HELP, should render Help Page" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "%STATIC_PAGES_CONTROLLER_TEST-I-ABOUT, should render About Page" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "%STATIC_PAGES_CONTROLLER_TEST-I-CONTACT, should render Contact Page" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
