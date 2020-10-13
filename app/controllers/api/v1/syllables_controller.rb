# frozen_string_literal: true

module Api
  module V1
    class SyllablesController < ApplicationController
      MODEL_MODULE = 'LanguageConcepts'
      include Concerns::Api::CommonControls

      VALID_OPERATORS = %w[
        $in
        $nin
        $ne
        $gt
        $gte
        $lt
        $lte
        $regex
        $all
        $eq
      ].freeze

      ACCEPTABLE_PARAMS = %i[
      ].freeze

      MUTABLE_PARAMS = %i[
      ].freeze
    end
  end
end
