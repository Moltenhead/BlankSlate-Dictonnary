class CreateSyllables < ActiveRecord::Migration[5.2]
  def change
    create_table :syllables do |t|

      t.timestamps
    end
  end
end
