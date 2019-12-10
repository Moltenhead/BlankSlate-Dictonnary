# frozen_string_literal: true

# Base Mongoid class
class ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  def pluck_only(*syms)
    syms = syms.map(&:to_sym)
    only(syms).pluck(syms)
  end
end
