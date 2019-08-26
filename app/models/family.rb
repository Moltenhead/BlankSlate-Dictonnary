# frozen_string_literal: true

# Group of syllable by usage
class Family < LanguageConcept
  field :precedence_degree, type: Number

  has_many :syllables
end
