require "application_system_test_case"

class TravelDatasetsTest < ApplicationSystemTestCase
  setup do
    @travel_dataset = travel_datasets(:one)
  end

  test "visiting the index" do
    visit travel_datasets_url
    assert_selector "h1", text: "Travel Datasets"
  end

  test "creating a Travel dataset" do
    visit travel_datasets_url
    click_on "New Travel Dataset"

    fill_in "Description", with: @travel_dataset.description
    fill_in "Name", with: @travel_dataset.name
    click_on "Create Travel dataset"

    assert_text "Travel dataset was successfully created"
    click_on "Back"
  end

  test "updating a Travel dataset" do
    visit travel_datasets_url
    click_on "Edit", match: :first

    fill_in "Description", with: @travel_dataset.description
    fill_in "Name", with: @travel_dataset.name
    click_on "Update Travel dataset"

    assert_text "Travel dataset was successfully updated"
    click_on "Back"
  end

  test "destroying a Travel dataset" do
    visit travel_datasets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Travel dataset was successfully destroyed"
  end
end
