require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

	test "should be valid" do
    	assert @user.valid?
  	end
	test "name should be present" do
   		@user.name = "     "
    	assert_not @user.valid?
  	end

