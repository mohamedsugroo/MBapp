require "application_system_test_case"

class AdvertsTest < ApplicationSystemTestCase
  setup do
    @advert = adverts(:one)
  end

  test "visiting the index" do
    visit adverts_url
    assert_selector "h1", text: "Adverts"
  end

  test "creating a Advert" do
    visit adverts_url
    click_on "New Advert"

    fill_in "Ad Code", with: @advert.ad_code
    fill_in "End Date", with: @advert.end_date
    fill_in "Name", with: @advert.name
    fill_in "Start Date", with: @advert.start_date
    click_on "Create Advert"

    assert_text "Advert was successfully created"
    click_on "Back"
  end

  test "updating a Advert" do
    visit adverts_url
    click_on "Edit", match: :first

    fill_in "Ad Code", with: @advert.ad_code
    fill_in "End Date", with: @advert.end_date
    fill_in "Name", with: @advert.name
    fill_in "Start Date", with: @advert.start_date
    click_on "Update Advert"

    assert_text "Advert was successfully updated"
    click_on "Back"
  end

  test "destroying a Advert" do
    visit adverts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Advert was successfully destroyed"
  end
end
