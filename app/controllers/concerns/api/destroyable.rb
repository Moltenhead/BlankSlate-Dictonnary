# frozen_string_literal: true

# app/hermes/models/concerns/destroyable.rb
module Concerns
  module Api
    # add query handlers
    module Destroyable
      extend ActiveSupport::Concern

      included do
        # ========================================== #
        # ---------------- ACTIONS  ---------------- #
        # ========================================== #
        def destroy
          return render_api_error(:not_found, :instance_not_found) unless @instance
          return render_api_error(:not_found, :not_admin_or_manager) unless user_can_destroy?
          return render(json: @instance.errors, status: :unprocessable_entity) unless @instance.destroy

          render(body: nil, status: :no_content)
        end
      end
    end
  end
end
