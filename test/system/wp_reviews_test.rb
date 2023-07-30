require "application_system_test_case"

class WpReviewsTest < ApplicationSystemTestCase
  setup do
    @wp_review = wp_reviews(:one)
  end

  test "visiting the index" do
    visit wp_reviews_url
    assert_selector "h1", text: "Wp Reviews"
  end

  test "creating a Wp review" do
    visit wp_reviews_url
    click_on "New Wp Review"

    fill_in "Content", with: @wp_review.content
    fill_in "Title", with: @wp_review.title
    click_on "Create Wp review"

    assert_text "Wp review was successfully created"
    click_on "Back"
  end

  test "updating a Wp review" do
    visit wp_reviews_url
    click_on "Edit", match: :first

    fill_in "Content", with: @wp_review.content
    fill_in "Title", with: @wp_review.title
    click_on "Update Wp review"

    assert_text "Wp review was successfully updated"
    click_on "Back"
  end

  test "destroying a Wp review" do
    visit wp_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wp review was successfully destroyed"
  end
end
