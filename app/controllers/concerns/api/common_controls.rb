# frozen_string_literal: true

# app/controllers/concerns/api/common_controls.rb

module Concerns
  module Api
    # add query handlers
    module CommonControls
      extend ActiveSupport::Concern

      included do
        def index
          acceptable_params self.class::ACCEPTABLE_PARAMS
          valid_operators self.class::VALID_OPERATORS
          super
        end

        def create
          mutable_params self.class::MUTABLE_PARAMS
          super
        end

        def udpate
          mutable_params self.class::MUTABLE_PARAMS
          super
        end
      end
    end
  end
end
