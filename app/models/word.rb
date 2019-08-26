# frozen_string_literal: true

# Aggregation of aggregates
class Word < LanguageConcept
  has_many :aggregates
  has_many :families

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
