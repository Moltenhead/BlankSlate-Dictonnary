# frozen_string_literal: true

module LanguageConcepts
  # Aggregation of aggregates
  class Word < LanguageConcept
    has_many :aggregates, class_name: 'LanguageConcepts::Aggregate'
    has_many :families, class_name: 'LanguageConcepts::Family'

    before_save :before_actions

    def inherhit_families
      self.families = syllables.pluck(families).flatten.uniq.compact
    end

    def inherit_concepts
      self.concepts = syllables.pluck(concepts).flatten.uniq.compact
    end

    def before_actions
      inherhit_families
      inherit_concepts
    end
  end
end
