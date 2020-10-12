# frozen_string_literal: true

# app/models/concerns/representable.rb

module Concerns
  module Representable
    extend ActiveSupport::Concern

    included do
      has_one :representation

      def representation_path
        representation&.full_path
      end
    end

    # module ClassMethods
    # end
  end
end
