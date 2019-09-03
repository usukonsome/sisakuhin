require 'test_helper'

class IkouControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ikou_new_url
    assert_response :success
  end

end
