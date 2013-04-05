class CreateWordVariations < ActiveRecord::Migration
  def change
    create_table :word_variations do |t|
      t.string :variation_word
      t.string :unique_word
      t.string :variation_word_desc
      t.references :unique_word
      
      t.timestamps
    end
      
    add_index :word_variations, :variation_word
    add_index :word_variations, :unique_word
    add_index :word_variations, :unique_word_id
  end
end
