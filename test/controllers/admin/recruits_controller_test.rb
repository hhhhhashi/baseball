require "test_helper"

class Admin::RecruitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_recruits_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_recruits_new_url
    assert_response :success
  end
end
