require 'test_helper'

class LanguageConceptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language_concept = language_concepts(:one)
  end

  test "should get index" do
    get language_concepts_url
    assert_response :success
  end

  test "should get new" do
    get new_language_concept_url
    assert_response :success
  end

  test "should create language_concept" do
    assert_difference('LanguageConcept.count') do
      post language_concepts_url, params: { language_concept: { description: @language_concept.description, phonologie: @language_concept.phonologie, roman: @language_concept.roman, run: @language_concept.run } }
    end

    assert_redirected_to language_concept_url(LanguageConcept.last)
  end

  test "should show language_concept" do
    get language_concept_url(@language_concept)
    assert_response :success
  end

  test "should get edit" do
    get edit_language_concept_url(@language_concept)
    assert_response :success
  end

  test "should update language_concept" do
    patch language_concept_url(@language_concept), params: { language_concept: { description: @language_concept.description, phonologie: @language_concept.phonologie, roman: @language_concept.roman, run: @language_concept.run } }
    assert_redirected_to language_concept_url(@language_concept)
  end

  test "should destroy language_concept" do
    assert_difference('LanguageConcept.count', -1) do
      delete language_concept_url(@language_concept)
    end

    assert_redirected_to language_concepts_url
  end
end
