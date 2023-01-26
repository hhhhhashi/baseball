require "test_helper"

class Public::RecruitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_recruit_index_url
    assert_response :success
  end

  test "should get show" do
    get public_recruit_show_url
    assert_response :success
  end

  test "should get new" do
    get public_recruit_new_url
    assert_response :success
  end

  test "should get create" do
    get public_recruit_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_recruit_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_recruit_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_recruit_destroy_url
    assert_response :success
  end
end
