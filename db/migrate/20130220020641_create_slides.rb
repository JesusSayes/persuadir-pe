class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
