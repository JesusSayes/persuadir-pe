class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :imageable_id
      t.string :imageable_type
      t.integer :user_id
      t.string :link

      t.timestamps
    end
  end
end
