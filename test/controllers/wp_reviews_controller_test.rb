require "test_helper"

class WpReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wp_review = wp_reviews(:one)
  end

  test "should get index" do
    get wp_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_wp_review_url
    assert_response :success
  end

  test "should create wp_review" do
    assert_difference('WpReview.count') do
      post wp_reviews_url, params: { wp_review: { content: @wp_review.content, title: @wp_review.title } }
    end

    assert_redirected_to wp_review_url(WpReview.last)
  end

  test "should show wp_review" do
    get wp_review_url(@wp_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_wp_review_url(@wp_review)
    assert_response :success
  end

  test "should update wp_review" do
    patch wp_review_url(@wp_review), params: { wp_review: { content: @wp_review.content, title: @wp_review.title } }
    assert_redirected_to wp_review_url(@wp_review)
  end

  test "should destroy wp_review" do
    assert_difference('WpReview.count', -1) do
      delete wp_review_url(@wp_review)
    end

    assert_redirected_to wp_reviews_url
  end
end
