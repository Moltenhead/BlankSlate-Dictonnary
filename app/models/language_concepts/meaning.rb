# frozen_string_literal: true

# A language concept
class Meaning < ApplicationRecord
  include Concerns::Nameable
  include Concerns::Descriptible

  has_and_belongs_to_many :meanings
  has_and_belongs_to_many :concepts
  has_and_belongs_to_many :syllables
end
