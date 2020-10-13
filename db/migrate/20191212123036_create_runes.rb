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

class CreateWords < Mongoid::Migration
  def self.up
    LanguageConcepts::Word.create(
      short_description: 'test',
      long_description: 'test',
      roman: 'test',
      phonology: 'test'
    )
  end

  def self.down
    LanguageConcepts::Word.where(
      short_description: 'test',
      long_description: 'test',
      roman: 'test',
      phonology: 'test'
    ).first.destroy
  end
end

class CreateSyllables < Mongoid::Migration
  def self.up
    LanguageConcepts::Syllable.create(
      short_description: 'test',
      long_description: 'test',
      roman: 'test',
      phonology: 'test'
    )
  end

  def self.down
    LanguageConcepts::Syllable.where(
      short_description: 'test',
      long_description: 'test',
      roman: 'test',
      phonology: 'test'
    ).first.destroy
  end
end

class CreateConcepts < Mongoid::Migration
  def self.up
    LanguageConcepts::Concept.create(
      name: 'test',
      type: 'test'
    )
  end

  def self.down
    LanguageConcepts::Concept.where(
      name: 'test',
      type: 'test'
    ).first.destroy
  end
end