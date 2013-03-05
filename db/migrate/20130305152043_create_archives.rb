class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :archive
      t.text :description

      t.timestamps
    end
  end
end
