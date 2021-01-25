require "application_system_test_case"

class TreksTest < ApplicationSystemTestCase
  setup do
    @trek = treks(:one)
  end

  test "visiting the index" do
    visit treks_url
    assert_selector "h1", text: "Treks"
  end

  test "creating a Trek" do
    visit treks_url
    click_on "New Trek"

    fill_in "Date", with: @trek.date
    fill_in "Distance in miles", with: @trek.distance_in_miles
    fill_in "User", with: @trek.user_id
    click_on "Create Trek"

    assert_text "Trek was successfully created"
    click_on "Back"
  end

  test "updating a Trek" do
    visit treks_url
    click_on "Edit", match: :first

    fill_in "Date", with: @trek.date
    fill_in "Distance in miles", with: @trek.distance_in_miles
    fill_in "User", with: @trek.user_id
    click_on "Update Trek"

    assert_text "Trek was successfully updated"
    click_on "Back"
  end

  test "destroying a Trek" do
    visit treks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trek was successfully destroyed"
  end
end
