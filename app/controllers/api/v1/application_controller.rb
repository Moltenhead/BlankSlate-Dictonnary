# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::Base
      include Concerns::Api::Collectionable,
              Concerns::Api::Instanceable,
              Concerns::Api::Showable,
              Concerns::Api::Mutable,
              Concerns::Api::Creatable,
              Concerns::Api::Destroyable 

      before_action :set_instance, only: %i[show edit update destroy]

      @@module_name = nil

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
        def module_name(module_name)
          @@module_name = module_name
        end
      end
    end
  end
end
