# frozen_string_literal: true

# app/hermes/models/concerns/instanceable.rb

module Concerns
  module Api
    # add query handlers
    module Instanceable
      extend ActiveSupport::Concern

      included do
        before_action :set_instance, only: %i[show edit update destroy]

        # ========================================== #
        # ---------------- ACTIONS  ---------------- #
        # ========================================== #
        def show
          return render_json_error(:not_found, :object_not_found) unless @instance

          render(
            jsonapi: @instance,
            serializer: @serializer,
            **@options
          )
        end

        private

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
