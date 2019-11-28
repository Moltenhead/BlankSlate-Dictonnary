# frozen_string_literal: true

# An abstract concept
class Concept < LanguageConcept
  include Concerns::Namable
  include Concerns::Typed

  has_many :words
end
