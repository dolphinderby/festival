require "test_helper"

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_tags_top_url
    assert_response :success
  end

  test "should get edit" do
    get admin_tags_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_tags_update_url
    assert_response :success
  end
end
