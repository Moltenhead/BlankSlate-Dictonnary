# frozen_string_literal: true

module Api
  module V1
    class RunesController < ApplicationController
      module_name 'LanguageConcepts'

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
      ]

      ACCEPTABLE_PARAMS = %i[
        id
        created_at
        updated_at
        name
        short_description
        long_description
        roman
        phonology
      ].freeze

      def index
        acceptable_params ACCEPTABLE_PARAMS
        valid_operators VALID_OPERATORS
        super
      end
    end
  end
end
