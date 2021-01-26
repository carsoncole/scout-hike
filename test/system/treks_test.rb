require "application_system_test_case"

class TreksTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
    @trek = create(:trek, user: @user)
  end

  test "visiting the index" do
    sign_in
    visit root_path
    click_on 'You'
    assert_selector "h1", text: "My hikes"
  end

  test "creating a Trek outside of a challenge" do
    sign_in
    visit root_path
    click_on 'You'
    click_on "New Hike"
    assert_selector 'h1', text: 'Log a Hike'
    assert_text "Ooops! Hikes can only be entered during the Challenge."
    find_button 'Save', disabled: true
    assert_selector 'h1', text: 'Log a Hike'
  end

  test "creating a Trek" do
    sign_in
    trek = build(:trek)
    visit root_path
    click_on 'You'
    click_on "New Hike"
    assert_selector 'h1', text: 'Log a Hike'
    assert_no_text "Ooops! Hikes can only be entered during the Challenge."

    fill_in "Distance in miles", with: trek.distance_in_miles
    click_on "Save"

    assert_text "Hike was successfully created"
    assert_selector '#total-miles', text: trek.distance_in_miles.to_s
  end

  # test "updating a Trek" do
  #   visit treks_url
  #   click_on "Edit", match: :first

  #   fill_in "Date", with: @trek.date
  #   fill_in "Distance in miles", with: @trek.distance_in_miles
  #   fill_in "User", with: @trek.user_id
  #   click_on "Update Trek"

  #   assert_text "Trek was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Trek" do
  #   visit treks_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Trek was successfully destroyed"
  # end
end
