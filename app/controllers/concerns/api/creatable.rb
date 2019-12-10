# frozen_string_literal: true

# app/controllers/concerns/api/creatable.rb

module Concerns
  module Api
    # add query handlers
    module Creatable
      extend ActiveSupport::Concern

      included do
        # ========================================== #
        # ---------------- ACTIONS  ---------------- #
        # ========================================== #
        def create
          @instance = @model.new(mutate_valid_params.merge(user_id: user_id))
          return respond_with_errors(@instance) unless @instance.save

          render(jsonapi: @instance, serializer: @serializer, status: :created)
        end
      end
    end
  end
end
