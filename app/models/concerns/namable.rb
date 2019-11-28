# frozen_string_literal: true

# app/models/concerns/namable.rb

module Concerns
  module Namable
    extend ActiveSupport::Concern

    included do
      field :name, type: String
    end

    # module ClassMethods
    # end
  end
end
