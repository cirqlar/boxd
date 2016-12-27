require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get sign_up_path
    assert_response :success
  end

  test "should get login" do
    get login_path 
    assert_response :success
  end

end
