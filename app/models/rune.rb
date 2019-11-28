# frozen_string_literal: true

# Language concepts
class Rune < ApplicationRecord
  include Concerns::Namable
  include Concerns::Descriptible
  include Concerns::Representable
  include COncerns::Romanizable
end
