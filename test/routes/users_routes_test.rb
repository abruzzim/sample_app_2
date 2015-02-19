require 'test_helper'

class UsersRoutesTest < ActionController::TestCase

	def setup
		puts "%USERS_ROUTES_TEST-I-SETUP, running setup method..."
	end

	def teardown
		puts "%USERS_ROUTES_TEST-I-TEARDOWN, running setup method..."
	end

	test "should route to user index" do
		assert_routing({ method: 'get', path: '/users' }, { controller: "users", action: "index" })
	end

	test "should route to show user" do
		assert_routing({ method: 'get', path: '/users/1' }, { controller: "users", action: "show", id: "1" })
	end

	test "should route to new user" do
		#assert_routing({ method: 'get', path: '/users/new' }, { controller: "users", action: "new" })
		assert_routing({ method: 'get', path: '/signup' }, { controller: "users", action: "new" })
	end

	test "should route to create user" do
		assert_routing({ method: 'post', path: '/users' }, { controller: "users", action: "create" })
	end

	test "should route to edit user" do
		assert_routing({ method: 'get', path: '/users/1/edit' }, { controller: "users", action: "edit", id: "1" })
	end

	test "should route to update user" do
		assert_routing({ method: 'patch', path: '/users/1' }, { controller: "users", action: "update", id: "1" })
	end

	test "should route to delete user" do
		assert_routing({ method: 'delete', path: '/users/1' }, { controller: "users", action: "destroy", id: "1" })
	end
end
