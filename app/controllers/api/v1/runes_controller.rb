# frozen_string_literal: true

module Api
  module V1
    class RunesController < ApplicationController
      model_module 'LanguageConcepts'
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
        id
        created_at
        updated_at
        name
        short_description
        long_description
        roman
        phonology
      ].freeze

      MUTABLE_PARAMS = %i[
        name
        short_description
        long_description
        roman
        phonology
      ].freeze
    end
  end
end
