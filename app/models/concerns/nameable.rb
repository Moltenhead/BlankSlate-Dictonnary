# frozen_string_literal: true

# app/models/concerns/nameable.rb

module Concerns
  module Nameable
    extend ActiveSupport::Concern

    included do
      field :name, type: String
    end

    # module ClassMethods
    # end
  end
end
