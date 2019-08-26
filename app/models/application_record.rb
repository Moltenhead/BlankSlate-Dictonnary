# frozen_string_literal: true

# Base Mongoid class
class ApplicationRecord < ActiveRecord::Base
  include Mongoid::Document
  include Mongoid::Timestamps
  self.abstract_class = true
end
