# frozen_string_literal: true

# app/hermes/models/concerns/showable.rb

module Concerns
  module Api
    # add query handlers
    module Showable
      extend ActiveSupport::Concern

      included do
        before_action :set_instance, only: %i[show]

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
      end
    end
  end
end
