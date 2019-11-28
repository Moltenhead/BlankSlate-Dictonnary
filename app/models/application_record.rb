# frozen_string_literal: true

# Base Mongoid class
class ApplicationRecord < ActiveRecord::Base
  include Mongoid::Document
  include Mongoid::Timestamps
  self.abstract_class = true

  def pluck_only(*syms)
    syms = syms.map(&:to_sym)
    only(syms).pluck(syms)
  end
end
