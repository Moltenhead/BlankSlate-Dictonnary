require 'test_helper'

class SyllablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @syllable = syllables(:one)
  end

  test "should get index" do
    get syllables_url
    assert_response :success
  end

  test "should get new" do
    get new_syllable_url
    assert_response :success
  end

  test "should create syllable" do
    assert_difference('Syllable.count') do
      post syllables_url, params: { syllable: { phonologie: @syllable.phonologie, roman: @syllable.roman, rune: @syllable.rune } }
    end

    assert_redirected_to syllable_url(Syllable.last)
  end

  test "should show syllable" do
    get syllable_url(@syllable)
    assert_response :success
  end

  test "should get edit" do
    get edit_syllable_url(@syllable)
    assert_response :success
  end

  test "should update syllable" do
    patch syllable_url(@syllable), params: { syllable: { phonologie: @syllable.phonologie, roman: @syllable.roman, rune: @syllable.rune } }
    assert_redirected_to syllable_url(@syllable)
  end

  test "should destroy syllable" do
    assert_difference('Syllable.count', -1) do
      delete syllable_url(@syllable)
    end

    assert_redirected_to syllables_url
  end
end
