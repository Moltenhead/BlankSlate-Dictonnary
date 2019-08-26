# frozen_string_literal: true

# A language concept
class Concept < LanguageConcept
  field :name, type: String
  field :meanings, type: Array
  field :short_description, type: Text
  field :long_description, type: Text

  has_many :concepts
  has_and_belongs_to_many :syllables

  def associated_concepts
    concepts
  end
end
