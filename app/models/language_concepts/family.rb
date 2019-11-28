# frozen_string_literal: true

module LanguageConcepts
  # Group of syllable by usage
  class Family < LanguageConcept
    field :precedence_degree, type: Number
    field :preceding_family_ids, type: Array
    field :following_family_ids, type: Array

    has_many :syllables, class_name: 'LanguageConcepts::Syllable'

    before_save :before_actions

    def preceding_families
      Family.where(:id.in => preceding_family_ids)
    end

    def following_families
      Family.where(:id.in => following_family_ids)
    end

    def before_actions
      handle_impossible_family_share

      update_precedence_degree
    end

    def after_save
      update_others_precedence_degrees
    end

    def handle_impossible_family_share
      impossible_family_shares = preceding_family_ids & following_family_ids
      raise "preceding and following families are sharing #{impossible_family_shares}" if impossible_family_shares.present?
    end

    def update_precedence_degree
      self.precedence_degree = preceding_families.only(:precedence_degree).pluck(:precedence_degree).min + 1
    end

    def update_others_precedence_degrees
      return unless Family.where(id: { :$ne => preceding_family_ids + following_family_ids })
                          .only_pluck(:precedence_degree).uniq.first == precedence_degree

      following_families.inc(precedence_degree: 1)
    end
  end
end
