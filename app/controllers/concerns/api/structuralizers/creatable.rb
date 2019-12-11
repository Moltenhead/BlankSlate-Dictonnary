# frozen_string_literal: true

# app/controllers/concerns/api/creatable.rb

module Concerns
  module Api
    module Structuralizers
      # add query handlers
      module Creatable
        extend ActiveSupport::Concern

        included do
          # ========================================== #
          # ---------------- ACTIONS  ---------------- #
          # ========================================== #
          def create
            @instance = @model.new(mutate_valid_params)
            return render_api_error(@instance) unless @instance.save

            render(json: @instance, serializer: @serializer, status: :created)
          end
        end
      end
    end
  end
end
