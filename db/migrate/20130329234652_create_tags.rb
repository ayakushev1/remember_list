class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.references :Remember

      t.timestamps
    end
    
    add_index :tags, :tag
    add_index :tags, :Remember_id
    
  end
end
