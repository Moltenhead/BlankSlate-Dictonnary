# frozen_string_literal: true

# Syllable
class Syllable < LanguageConcept
  field :inversion_roman, type: String

  belongs_to :family
  has_many :concepts

  before_save :before_actions

  def update_inversion
    self.inversion_romane = "#{roman}-Ni"
  end

  def before_actions
    update_inversion
  end
end
