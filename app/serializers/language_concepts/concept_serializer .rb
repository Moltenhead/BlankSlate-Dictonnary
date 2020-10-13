# frozen_string_literal: true

module LanguageConcepts
  class ConceptSerializer < ::ApplicationSerializer
    type 'concepts'

    attributes(
      :name,
      :type
    )

    #has_one :representation do
    #  data do
    #    @object.representation
    #  end
    #end
  end
end
