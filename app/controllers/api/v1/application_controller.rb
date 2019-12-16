# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::Base
      include Concerns::Api::Structuralizers::Collectionable
      include Concerns::Api::Structuralizers::Instanceable
      include Concerns::Api::Structuralizers::Showable
      include Concerns::Api::Structuralizers::Mutable
      include Concerns::Api::Structuralizers::Creatable
      include Concerns::Api::Structuralizers::Updatable
      include Concerns::Api::Structuralizers::Destroyable

      before_action :set_instance, only: %i[show edit update destroy]
      skip_before_action :verify_authenticity_token

      @@model_module = nil

      # INTIALIZE
      def initialize
        super
        @model_name = (@@model_module ? "#{@@model_module}::" : '') + controller_name.classify
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

      # def render(resources, options = {})
      #   options   = options.dup
      #   klass     = options.delete(:class) || {}
      #   exposures = options.delete(:expose) || {}
      #   exposures = exposures.merge(_class: klass)

      #   resources =
      #     JSONAPI::Serializable.resources_for(resources, exposures, klass)
      #   puts options
      #   puts @renderer.render(options.merge(data: resources))

      #   @renderer.render(options.merge(data: resources))
      # end

      # def render_errors(errors, options = {})
      #   options   = options.dup
      #   klass     = options.delete(:class) || {}
      #   exposures = options.delete(:expose) || {}

      #   errors =
      #     JSONAPI::Serializable.resources_for(errors, exposures, klass)

      #   @renderer.render(options.merge(errors: errors))
      # end

      # CLASS METHODS
      class << self
        def model_module(model_module_name)
          @@model_module = model_module_name
        end
      end
    end
  end
end
