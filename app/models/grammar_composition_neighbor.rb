class GrammarCompositionNeighbor < ApplicationRecord
  field :relative_position, type: Integer

  has_one :grammar_composition
end
