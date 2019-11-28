# frozen_string_literal: true

# Language concepts
class Rune < ApplicationRecord
  include Concerns::Nameable
  include Concerns::Descriptible
  include Concerns::Representable
  include Concerns::Romanizable
end
