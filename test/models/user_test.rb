# Reference: http://guides.rubyonrails.org/testing.html#what-to-include-in-your-unit-tests

require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		puts "%USER_TEST-I-SETUP, running setup method..."
		@test_user = User.new(name: "Charlie Brown", email: "cbrown@example.com")
	end

	def teardown
		puts "%USER_TEST-I-TEARDOWN, running teardown method..."
	end

	test "user should be valid" do
		puts "%USER_TEST-I-OBJECT, user should be valid."
		assert @test_user.valid?
	end

	test "user name should be present" do
		puts "%USER_TEST-I-NAME, Validating user name..."
		@test_user.name = " "
		assert( !@test_user.valid?, "%USER_TEST-F-NAME, User name must be present and not blank." ) 
	end

	test "user name should be less than 51 characters" do
		puts "%USER_TEST-I-NAME, Validating user name length..."
		@test_user.name = "a" * 51
		assert( !@test_user.valid?, "%USER_TEST-F-NAME, User name length must be less than 51 characters." ) 
	end

	test "email should be present" do
		puts "%USER_TEST-I-EMAIL, Validating email..."
		@test_user.email = " "
		assert( !@test_user.valid?, "%USER_TEST-F-EMAIL, Email must be present and not blank." ) 
	end

	test "email address should be less than 255 characters" do
		puts "%USER_TEST-I-EMAIL, Validating email length..."
		@test_user.email = "a" * 255
		assert( !@test_user.valid?, "%USER_TEST-F-EMAIL, Email length must be less than 255 characters." ) 
	end

	test "email address should be RFC 3696 compliant" do
		puts "%USER_TEST-I-EMAIL, Validating email compliance..."

		invalid_emails = []
		invalid_emails << 'Abc.example.com'
		invalid_emails << 'A@b@c@example.com'
		invalid_emails << 'a"b(c)d,e:f;g<h>i[j\k]l@example.com'
		invalid_emails << 'just"not"right@example.com'
		invalid_emails << 'this is"not\allowed@example.com'
		invalid_emails << 'this\ still\"not\\allowed@example.com'
		invalid_emails.each do |invalid_email|
			@test_user.email = invalid_email
			assert( !@test_user.valid?, "%USER_TEST-F-EMAIL, #{invalid_email.inspect} should be invalid." )
		end

		valid_emails = []
		valid_emails << 'niceandsimple@example.com'
		valid_emails << 'very.common@example.com'
		valid_emails << 'a.little.lengthy.but.fine@dept.example.com'
		valid_emails << 'disposable.style.email.with+symbol@example.com'
		valid_emails << 'other.email-with-dash@example.com'
		valid_emails.each do |valid_email|
			@test_user.email = valid_email
			assert( @test_user.valid?, "%USER_TEST-F-EMAIL, #{valid_email.inspect} should be valid." )
		end
	end

	test "email address should be unique" do
		puts "%USER_TEST-I-EMAIL, Validating email uniqueness..."
		dup_test_user = @test_user.dup
		dup_test_user.email = @test_user.email.upcase
		@test_user.save
		assert( !dup_test_user.valid?, "%USER_TEST-F-EMAIL, duplicate email should be invalid." )
	end

end
