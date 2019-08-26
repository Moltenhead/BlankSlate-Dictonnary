# frozen_string_literal: true

# Aggregation of syllables
class Aggregate < LanguageConcept
  has_many :syllables
  has_many :families
  has_many :concepts

  before_save :before_actions

  def inherhit_families
    families = syllables.pluck(families).flatten.uniq.compact
  end

  def inherit_concepts
    concepts = syllables.pluck(concepts).flatten.uniq.compact
  end

  def before_actions
    inherhit_families
    inherit_concepts
  end
end
