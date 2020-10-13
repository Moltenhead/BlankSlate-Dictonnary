# frozen_string_literal: true

9.times do |i|
  [LanguageConcepts::Concept, LanguageConcepts::Rune].each do |model|
    model.create(
      name: "name#{i}",
      short_description: 'ce qui est rare et les liquides',
      long_description: 'Voluptate dolor amet et in nulla labore dolor officia sunt officia officia adipisicing deserunt aliquip. Lorem consequat aliquip id do sunt amet adipisicing culpa dolor ut do. Magna est fugiat ea nulla. Id pariatur eu qui eiusmod non exercitation in sit nisi.'\
                        ''\
                        'Deserunt ad dolore sit deserunt est dolore aliqua esse. Ipsum enim irure ut consectetur officia cupidatat qui cupidatat nulla nulla cillum. Nisi anim excepteur ut magna culpa aute nostrud excepteur.'\
                        'In excepteur consectetur do eiusmod et sit. Minim mollit aute quis laborum officia sint. Nostrud irure et dolor reprehenderit occaecat esse enim mollit exercitation aliqua ex. Pariatur in commodo esse ad.',
      roman: "roman#{i}"
    )
  end
end
