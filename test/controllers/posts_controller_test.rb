require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

end
