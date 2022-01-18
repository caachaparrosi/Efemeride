require "application_system_test_case"

class EfemeridesTest < ApplicationSystemTestCase
  setup do
    @efemeride = efemerides(:one)
  end

  test "visiting the index" do
    visit efemerides_url
    assert_selector "h1", text: "Efemerides"
  end

  test "should create efemeride" do
    visit efemerides_url
    click_on "New efemeride"

    fill_in "Categories", with: @efemeride.categories
    fill_in "Comments", with: @efemeride.comments
    fill_in "Date", with: @efemeride.date
    fill_in "Photo", with: @efemeride.photo
    click_on "Create Efemeride"

    assert_text "Efemeride was successfully created"
    click_on "Back"
  end

  test "should update Efemeride" do
    visit efemeride_url(@efemeride)
    click_on "Edit this efemeride", match: :first

    fill_in "Categories", with: @efemeride.categories
    fill_in "Comments", with: @efemeride.comments
    fill_in "Date", with: @efemeride.date
    fill_in "Photo", with: @efemeride.photo
    click_on "Update Efemeride"

    assert_text "Efemeride was successfully updated"
    click_on "Back"
  end

  test "should destroy Efemeride" do
    visit efemeride_url(@efemeride)
    click_on "Destroy this efemeride", match: :first

    assert_text "Efemeride was successfully destroyed"
  end
end
