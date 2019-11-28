# frozen_string_literal: true

module LanguageConcepts
  # An abstract concept
  class Concept < LanguageConcept
    include Concerns::Nameable
    include Concerns::Typed

    has_many :words, class_name: 'LanguageConcepts::Word'
  end
end
