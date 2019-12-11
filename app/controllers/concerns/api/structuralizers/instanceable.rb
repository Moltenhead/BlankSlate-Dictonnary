# frozen_string_literal: true

# app/controllers/concerns/api/instanceable.rb

module Concerns
  module Api
    module Structuralizers
      # add query handlers
      module Instanceable
        extend ActiveSupport::Concern

        included do
          # Use callbacks to share common setup or constraints between actions.
          def set_instance
            @instance = @model.find(params[:id])
          end

          # Never trust parameters from the scary internet, only allow the white list through.
          def instance_params
            params.fetch(:instance, {})
          end
        end
      end
    end
  end
end
