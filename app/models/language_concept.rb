# frozen_string_literal: true

# Language concepts
class LanguageConcept < ApplicationRecord
  field :roman, type: String
  field :rune, type: String
  field :phonologie, type: String
  field :description, type: String
end
