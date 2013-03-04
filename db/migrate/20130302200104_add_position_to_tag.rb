class AddPositionToTag < ActiveRecord::Migration
  def change
    add_column :tags, :position, :integer
  end
end
