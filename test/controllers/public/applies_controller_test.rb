require "test_helper"

class Public::AppliesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_applies_new_url
    assert_response :success
  end
end
