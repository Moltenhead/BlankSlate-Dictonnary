# frozen_string_literal: true

module LanguageConcepts
  # Language concepts
  class LanguageConcept < ApplicationRecord
    include Concerns::Descriptible
    include Concerns::Romanizable

    has_many :runes, class_name: 'LanguageConcepts::Rune'
  end
end
