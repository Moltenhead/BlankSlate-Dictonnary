# frozen_string_literal: true

module LanguageConcepts
  # A language concept
  class Meaning < ApplicationRecord
    include Concerns::Nameable
    include Concerns::Descriptible

    has_and_belongs_to_many :meanings, class_name: 'LanguageConcepts::Meaning'
    has_and_belongs_to_many :concepts, class_name: 'LanguageConcepts::Concept'
    has_and_belongs_to_many :syllables, class_name: 'LanguageConcepts::Syllable'
  end
end
