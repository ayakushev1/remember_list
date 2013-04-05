class CreateUniqueWords < ActiveRecord::Migration
  def change
    create_table :unique_words do |t|
      t.string :unique_word
      t.string :unique_word_desc
      t.string :language
      t.string :word_type
          
      t.timestamps
    end

    add_index :unique_words, :unique_word
    add_index :unique_words, :language
    add_index :unique_words, :word_type
  end
end
