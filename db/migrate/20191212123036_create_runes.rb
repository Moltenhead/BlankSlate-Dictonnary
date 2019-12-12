# frozen_string_literal: true

class CreateRunes < Mongoid::Migration
  def self.up
    LanguageConcepts::Rune.create(
      name: 'test',
      short_description: 'test',
      long_description: 'test',
      roman: 'test',
      phonology: 'test'
    )
  end

  def self.down
    LanguageConcepts::Rune.where(
      name: 'test',
      short_description: 'test',
      long_description: 'test',
      roman: 'test',
      phonology: 'test'
    ).first.destroy
  end
end
