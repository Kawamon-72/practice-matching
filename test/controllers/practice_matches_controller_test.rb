require "test_helper"

class PracticeMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @practice_match = practice_matches(:one)
  end

  test "should get index" do
    get practice_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_practice_match_url
    assert_response :success
  end

  test "should create practice_match" do
    assert_difference("PracticeMatch.count") do
      post practice_matches_url, params: { practice_match: { created_at: @practice_match.created_at, number_of_accept: @practice_match.number_of_accept, place: @practice_match.place, remarks: @practice_match.remarks, schedule: @practice_match.schedule, updated_at: @practice_match.updated_at } }
    end

    assert_redirected_to practice_match_url(PracticeMatch.last)
  end

  test "should show practice_match" do
    get practice_match_url(@practice_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_practice_match_url(@practice_match)
    assert_response :success
  end

  test "should update practice_match" do
    patch practice_match_url(@practice_match), params: { practice_match: { created_at: @practice_match.created_at, number_of_accept: @practice_match.number_of_accept, place: @practice_match.place, remarks: @practice_match.remarks, schedule: @practice_match.schedule, updated_at: @practice_match.updated_at } }
    assert_redirected_to practice_match_url(@practice_match)
  end

  test "should destroy practice_match" do
    assert_difference("PracticeMatch.count", -1) do
      delete practice_match_url(@practice_match)
    end

    assert_redirected_to practice_matches_url
  end
end
