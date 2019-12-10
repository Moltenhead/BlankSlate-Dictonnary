# frozen_string_literal: true

module LanguageConcepts
  class RuneSerializer < ApplicationSerializer
    type 'runes'

    attributes [
      :name,
      :short_description,
      :long_description,
      :roman,
      :phonology
    ]

    #has_one :representation do
    #  data do
    #    @object.representation
    #  end
    #end
  end
end
