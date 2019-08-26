# frozen_string_literal: true

# Syllable
class Syllable < LanguageConcept
  filed :inversion_roman, type: String

  belongs_to :family

  before_save :before_actions

  def update_inversion
    inversion_romane = "#{roman}-Ni"
  end

  def before_actions
    update_inversion
  end
end
