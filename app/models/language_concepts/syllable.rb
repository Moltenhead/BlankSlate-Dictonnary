# frozen_string_literal: true

module LanguageConcepts
  # Syllable
  class Syllable < LanguageConcept
    field :inversion_roman, type: String

    belongs_to :family, class_name: 'LanguageConcepts::Family'
    has_many :concepts, class_name: 'LanguageConcepts::Concepts'

    before_save :before_actions

    def update_inversion
      self.inversion_romane = "#{roman}-Ni"
    end

    def before_actions
      update_inversion
    end
  end
end
