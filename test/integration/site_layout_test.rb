require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
  	puts "%SITE_LAYOUT_TEST-I-SETUP, running setup method..."
  end

  # Reference: http://guides.rubyonrails.org/testing.html#integration-testing

  test "should render layout links" do
  	get root_path
  	# Assert that the request was rendered with the appropriate template file.
  	assert_template('static_pages/home')
  	# Assert the presence of key HTML elements.
  	# Note: Rails inserts the value of "?_path" in place of the question mark.
  	assert_select "a[href=?]", root_path, count: 2
  	assert_select "a[href=?]", help_path
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", contact_path
  end

end
