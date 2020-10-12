# frozen_string_literal: true

# app/controllers/concerns/api/showable.rb

module Concerns
  module Api
    module Structuralizers
      # add query handlers
      module Showable
        extend ActiveSupport::Concern

        included do
          # ========================================== #
          # ---------------- ACTIONS  ---------------- #
          # ========================================== #
          def show
            return render_api_error(:not_found, :object_not_found) unless @instance

            @options ||= {}
            render(
              json: @instance,
              serializer: @serializer,
              **@options
            )
          end
        end
      end
    end
  end
end
