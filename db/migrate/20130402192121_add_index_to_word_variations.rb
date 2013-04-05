class AddIndexToWordVariations < ActiveRecord::Migration
  def change
    remove_index :word_variations, :variation_word
    add_index :word_variations, :variation_word, :COLLATE => :NOCASE
  end
end
