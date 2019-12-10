# frozen_string_literal: true

# app/hermes/models/concerns/creatable.rb

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
          user_id = @user.id
          param_user = params&.fetch(:data, nil)&.fetch(:attributes, nil)&.fetch(:user_id, nil)
          user_id = param_user if @user.has_role?('Administrator') && param_user
          @instance = @model.new(mutate_valid_params.merge(user_id: user_id))
          return respond_with_errors(@instance) unless @instance.save

          render(jsonapi: @instance, serializer: @serializer, status: :created)
        end
      end
    end
  end
end
