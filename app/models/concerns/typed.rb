# frozen_string_literal: true

# app/models/concerns/typed.rb

module Concerns
  module Typed
    extend ActiveSupport::Concern

    included do
      field :type, type: String
    end

    # module ClassMethods
    # end
  end
end
