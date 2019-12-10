# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ::ActionController::Base
      self.abstract_class = true

      %w[
        Collectionable
        Instanceable
        Showable
        Mutable
        Creatable
        Destroyable
      ].each do |api_concern_name|
        self.class.send(:include, "Concerns::Api::#{api_concern_name}".constantize)
      end

      # INTIALIZE
      def initialize
        super
        @model_name = (@@module_name ? "#{@@module_name}::" : '') + controller_name.classify
        begin
          if @model_name && @model_name != 'Application'
            @model = @model_name.constantize
            @serializer = "#{@model_name}Serializer".constantize
          end
        rescue NameError => e
          Rails.logger.warn "TEST was unable to process model or serializer #{e}"
        end
        @acceptable_params = @regex_params = @regex_default_params = @regex_params = @valid_operators = []
      end

      # CLASS METHODS
      class << self
        def module_name(module_name)
          @@module_name = module_name
        end
      end
    end
  end
end
