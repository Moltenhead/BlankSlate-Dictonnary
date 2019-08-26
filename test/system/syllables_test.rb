require "application_system_test_case"

class SyllablesTest < ApplicationSystemTestCase
  setup do
    @syllable = syllables(:one)
  end

  test "visiting the index" do
    visit syllables_url
    assert_selector "h1", text: "Syllables"
  end

  test "creating a Syllable" do
    visit syllables_url
    click_on "New Syllable"

    fill_in "Phonologie", with: @syllable.phonologie
    fill_in "Roman", with: @syllable.roman
    fill_in "Rune", with: @syllable.rune
    click_on "Create Syllable"

    assert_text "Syllable was successfully created"
    click_on "Back"
  end

  test "updating a Syllable" do
    visit syllables_url
    click_on "Edit", match: :first

    fill_in "Phonologie", with: @syllable.phonologie
    fill_in "Roman", with: @syllable.roman
    fill_in "Rune", with: @syllable.rune
    click_on "Update Syllable"

    assert_text "Syllable was successfully updated"
    click_on "Back"
  end

  test "destroying a Syllable" do
    visit syllables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Syllable was successfully destroyed"
  end
end
