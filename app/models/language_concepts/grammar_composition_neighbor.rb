# frozen_string_literal: true

module LanguageConcepts
  class GrammarCompositionNeighbor < ApplicationRecord
    field :relative_position, type: Integer

    has_one :grammar_composition
  end
end
