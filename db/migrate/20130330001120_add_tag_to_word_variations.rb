class AddTagToWordVariations < ActiveRecord::Migration
  def change
    add_column :tags, :word_variation_id, :integer
  end
end
