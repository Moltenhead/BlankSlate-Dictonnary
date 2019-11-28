# frozen_string_literal: true

# Language concepts
class LanguageConcept < ApplicationRecord
  include Concerns::Descriptible
  include Concerns::Romanizable

  has_many :runes
end
