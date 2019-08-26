require "application_system_test_case"

class AggregatesTest < ApplicationSystemTestCase
  setup do
    @aggregate = aggregates(:one)
  end

  test "visiting the index" do
    visit aggregates_url
    assert_selector "h1", text: "Aggregates"
  end

  test "creating a Aggregate" do
    visit aggregates_url
    click_on "New Aggregate"

    click_on "Create Aggregate"

    assert_text "Aggregate was successfully created"
    click_on "Back"
  end

  test "updating a Aggregate" do
    visit aggregates_url
    click_on "Edit", match: :first

    click_on "Update Aggregate"

    assert_text "Aggregate was successfully updated"
    click_on "Back"
  end

  test "destroying a Aggregate" do
    visit aggregates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aggregate was successfully destroyed"
  end
end
