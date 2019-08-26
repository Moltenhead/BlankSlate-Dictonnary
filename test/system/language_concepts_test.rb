require "application_system_test_case"

class LanguageConceptsTest < ApplicationSystemTestCase
  setup do
    @language_concept = language_concepts(:one)
  end

  test "visiting the index" do
    visit language_concepts_url
    assert_selector "h1", text: "Language Concepts"
  end

  test "creating a Language concept" do
    visit language_concepts_url
    click_on "New Language Concept"

    fill_in "Description", with: @language_concept.description
    fill_in "Phonologie", with: @language_concept.phonologie
    fill_in "Roman", with: @language_concept.roman
    fill_in "Run", with: @language_concept.run
    click_on "Create Language concept"

    assert_text "Language concept was successfully created"
    click_on "Back"
  end

  test "updating a Language concept" do
    visit language_concepts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @language_concept.description
    fill_in "Phonologie", with: @language_concept.phonologie
    fill_in "Roman", with: @language_concept.roman
    fill_in "Run", with: @language_concept.run
    click_on "Update Language concept"

    assert_text "Language concept was successfully updated"
    click_on "Back"
  end

  test "destroying a Language concept" do
    visit language_concepts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Language concept was successfully destroyed"
  end
end
