require "test_helper"

class HotdealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotdeal = hotdeals(:one)
  end

  test "should get index" do
    get hotdeals_url
    assert_response :success
  end

  test "should get new" do
    get new_hotdeal_url
    assert_response :success
  end

  test "should create hotdeal" do
    assert_difference('Hotdeal.count') do
      post hotdeals_url, params: { hotdeal: { deal_title: @hotdeal.deal_title } }
    end

    assert_redirected_to hotdeal_url(Hotdeal.last)
  end

  test "should show hotdeal" do
    get hotdeal_url(@hotdeal)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotdeal_url(@hotdeal)
    assert_response :success
  end

  test "should update hotdeal" do
    patch hotdeal_url(@hotdeal), params: { hotdeal: { deal_title: @hotdeal.deal_title } }
    assert_redirected_to hotdeal_url(@hotdeal)
  end

  test "should destroy hotdeal" do
    assert_difference('Hotdeal.count', -1) do
      delete hotdeal_url(@hotdeal)
    end

    assert_redirected_to hotdeals_url
  end
end
