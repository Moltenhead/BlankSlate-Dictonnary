# frozen_string_literal: true

module LanguageConcepts
  class GrammarComposition < LanguageConcept
    include Concerns::Nameable

    field :preceding_family_ids, type: Array, default: []
    field :following_family_ids, type: Array, default: []

    field :aggregate_positions, type: Integer

    belongs_to :family, class_name: 'LanguageConcepts::Family'
    has_many :grammar_composition_neighbors, 'LanguageConcepts::GrammarCompositionNeighbor'

    def preceded?
      preceding_family_ids.present?
    end

    def folowed?
      following_family_ids.present?
    end
  end
end
