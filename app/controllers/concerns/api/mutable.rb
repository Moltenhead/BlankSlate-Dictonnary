# frozen_string_literal: true

# app/hermes/models/concerns/mutable.rb

module Concerns
  module Api
    # add query handlers
    module Mutable
      extend ActiveSupport::Concern

      included do
        # ========================================== #
        # --------------- UTILITIES  --------------- #
        # ========================================== #
        def mutable_params(*value)
          @mutable_params = value
        end

        def mutate_valid_params(with_mutable_params = true)
          final_mutable_params = @mutable_params.clone || []
          final_mutable_params.concat(@@mutable_params.clone) if with_mutable_params
          ActiveModelSerializers::Deserialization.jsonapi_parse!(
            params,
            only: final_mutable_params, key_transform: :unaltered
          ).merge(@additional_params)
        end

        # ========================================== #
        # ---------------- ACTIONS  ---------------- #
        # ========================================== #
        def update
          return render_api_error(:not_found, :object_not_found) unless @instance

          valid_params = mutate_valid_params
          return render_api_error(:unprocessable_entity, :no_valid_parameters) unless valid_params.present?
          return render(json: @instance.errors, status: :unprocessable_entity) unless @instance.update(valid_params) && @instance.save

          render(jsonapi: @instance, serializer: @serializer)
        end
      end

      module ClassMethods
        def base_mutable_params(*value)
          @@base_mutable_params = value || []
        end
      end
    end
  end
end
