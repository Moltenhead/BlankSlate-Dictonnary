require 'faker'

FactoryBot.define do
  factory :rune, class: LanguageConcepts::Rune do
    name { Faker::Name.name }
  end
end
