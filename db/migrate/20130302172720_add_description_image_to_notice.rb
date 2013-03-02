class AddDescriptionImageToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :description_image, :text
  end
end
