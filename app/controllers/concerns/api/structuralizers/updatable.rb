# frozen_string_literal: true

# app/controllers/concerns/api/updatable.rb

module Concerns
  module Api
    module Structuralizers
      # add query handlers
      module Updatable
        extend ActiveSupport::Concern

        included do
          # ========================================== #
          # ---------------- ACTIONS  ---------------- #
          # ========================================== #
          def update
            return render_api_error(:not_found, :object_not_found) unless @instance

            valid_params = mutate_valid_params
            return render_api_error(:unprocessable_entity, :no_valid_parameters) unless valid_params.present?
            return render(json: @instance.errors, status: :unprocessable_entity) unless @instance.update(valid_params) && @instance.save

            render(json: @instance, serializer: @serializer)
          end
        end
      end
    end
  end
end
