# frozen_string_literal: true

# Aggregation of syllables
class Aggregate < LanguageConcept
  has_many :syllables
  has_many :families

  before_save :before_actions

  def inherhit_families
    families = syllables.pluck(families).flatten.uniq.compact
  end

  def before_actions
    inherhit_families
  end
end
