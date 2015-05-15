require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Bill Donavan", username: "Billy_D", email: "billyg@gmail.com",
												password: "password", password_confirmation: "password")
	end

	test "Make sure user is valid" do
		assert @user.valid?
	end

	test "All fields should be present" do
		@user.name = " "
		@user.username = " "
		@user.email = " "
		assert_not @user.valid?
	end

	test "name should be less than 45 characters" do
		@user.name = "a" * 46
		assert_not @user.valid?
	end

	test "username should be at least 3 characters" do
		@user.username = "aa"
		assert_not @user.valid?
	end

	test "username should be no longer than 25 characters" do
		@user.username = "a" * 26
		assert_not @user.valid?
	end

	test "email should not be longer than 255 characters" do
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end

	test "email validation should accept valid addresses" do
	    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
	                         first.last@foo.jp alice+bob@baz.cn]
	    valid_addresses.each do |valid_address|
	      @user.email = valid_address
	      assert @user.valid?, "#{valid_address.inspect} should be valid"
	    end
	end

	test "email validation should reject invalid addresses" do
	    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
	                           foo@bar_baz.com foo@bar+baz.com]
	    invalid_addresses.each do |invalid_address|
	      @user.email = invalid_address
	      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
	  end 
	end

	test "password fields should not be blank" do
		@user.password = " "
		@user.password_confirmation = " "
		assert_not @user.valid?
	end

	test "password should be greater than 5" do
		@user.password = "a" * 4
		assert_not @user.valid?
	end


end
