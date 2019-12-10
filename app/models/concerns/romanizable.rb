# frozen_string_literal: true

# app/models/concerns/romanizable.rb

module Concerns
  module Romanizable
    extend ActiveSupport::Concern

    included do
      field :roman, type: String
      field :phonology, type: String
    end

    # module ClassMethods
    # end
  end
end