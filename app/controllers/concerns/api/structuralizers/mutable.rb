# frozen_string_literal: true

# app/controllers/concerns/api/mutable.rb

module Concerns
  module Api
    module Structuralizers
      # add query handlers
      module Mutable
        extend ActiveSupport::Concern

        included do
          # ========================================== #
          # --------------- UTILITIES  --------------- #
          # ========================================== #
          def mutable_params(value)
            @mutable_params = (value || [])
          end

          def mutate_valid_params
            ActiveModelSerializers::Deserialization.jsonapi_parse!(
              params.permit!.to_h,
              only: @mutable_params,
              key_transform: :unaltered
            ).merge(@additional_params || {})
          end
        end
      end
    end
  end
end
