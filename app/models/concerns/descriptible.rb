# frozen_string_literal: true

# app/hermes/models/concerns/descriptible.rb

module Concerns
  module Descriptible
    extend ActiveSupport::Concern

    included do
      field :short_description, type: String
      field :long_description, type: String
    end

    # module ClassMethods
    # end
  end
end
