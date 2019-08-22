require 'test_helper'

class LoginFormControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_form_login_url
    assert_response :success
  end

end
