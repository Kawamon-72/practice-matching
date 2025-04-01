require "application_system_test_case"

class PracticeMatchesTest < ApplicationSystemTestCase
  setup do
    @practice_match = practice_matches(:one)
  end

  test "visiting the index" do
    visit practice_matches_url
    assert_selector "h1", text: "Practice matches"
  end

  test "should create practice match" do
    visit practice_matches_url
    click_on "New practice match"

    fill_in "Created at", with: @practice_match.created_at
    fill_in "Number of accept", with: @practice_match.number_of_accept
    fill_in "Place", with: @practice_match.place
    fill_in "Remarks", with: @practice_match.remarks
    fill_in "Schedule", with: @practice_match.schedule
    fill_in "Updated at", with: @practice_match.updated_at
    click_on "Create Practice match"

    assert_text "Practice match was successfully created"
    click_on "Back"
  end

  test "should update Practice match" do
    visit practice_match_url(@practice_match)
    click_on "Edit this practice match", match: :first

    fill_in "Created at", with: @practice_match.created_at.to_s
    fill_in "Number of accept", with: @practice_match.number_of_accept
    fill_in "Place", with: @practice_match.place
    fill_in "Remarks", with: @practice_match.remarks
    fill_in "Schedule", with: @practice_match.schedule
    fill_in "Updated at", with: @practice_match.updated_at.to_s
    click_on "Update Practice match"

    assert_text "Practice match was successfully updated"
    click_on "Back"
  end

  test "should destroy Practice match" do
    visit practice_match_url(@practice_match)
    click_on "Destroy this practice match", match: :first

    assert_text "Practice match was successfully destroyed"
  end
end
