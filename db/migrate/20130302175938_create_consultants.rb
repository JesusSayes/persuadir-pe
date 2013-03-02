class CreateConsultants < ActiveRecord::Migration
  def change
    create_table :consultants do |t|
      t.string :name
      t.string :charge
      t.text :description
      t.boolean :public
      t.string :image

      t.timestamps
    end
  end
end
