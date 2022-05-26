require "test_helper"

class Pbulic::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pbulic_items_index_url
    assert_response :success
  end

  test "should get update" do
    get pbulic_items_update_url
    assert_response :success
  end

  test "should get create" do
    get pbulic_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get pbulic_items_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get pbulic_items_destroy_all_url
    assert_response :success
  end
end
