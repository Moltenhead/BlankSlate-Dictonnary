# frozen_string_literal: true

module LanguageConcepts
  # Aggregation of syllables
  class Aggregate < LanguageConcept
    has_many :syllables, class_name: 'LanguageConcepts::Syllable'
    has_many :families, class_name: 'LanguageConcepts::Family'
    has_many :concepts, class_name: 'LanguageConcepts::Concept'
    has_many :grammar_compositions, class_name: 'LanguageConcepts::GrammarCompositions'

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
