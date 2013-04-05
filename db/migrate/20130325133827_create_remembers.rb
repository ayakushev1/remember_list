class CreateRemembers < ActiveRecord::Migration
  def change
    create_table :remembers do |t|
      t.string :name
      t.string :tags
      t.text :short_desc
      t.text :full_desc
      t.string :ref_name
      t.boolean :active
      t.string :ref_type

      t.timestamps
    end
  end
end
