require "test_helper"

class ClippingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clipping = clippings(:one)
  end

  test "should get index" do
    get clippings_url
    assert_response :success
  end

  test "should get new" do
    get new_clipping_url
    assert_response :success
  end

  test "should create clipping" do
    assert_difference('Clipping.count') do
      post clippings_url, params: { clipping: { cli_title: @clipping.cli_title } }
    end

    assert_redirected_to clipping_url(Clipping.last)
  end

  test "should show clipping" do
    get clipping_url(@clipping)
    assert_response :success
  end

  test "should get edit" do
    get edit_clipping_url(@clipping)
    assert_response :success
  end

  test "should update clipping" do
    patch clipping_url(@clipping), params: { clipping: { cli_title: @clipping.cli_title } }
    assert_redirected_to clipping_url(@clipping)
  end

  test "should destroy clipping" do
    assert_difference('Clipping.count', -1) do
      delete clipping_url(@clipping)
    end

    assert_redirected_to clippings_url
  end
end
