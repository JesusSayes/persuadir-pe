class RenameTagIdToPageIdFromWorkshop < ActiveRecord::Migration
  def up
    change_table :workshops do |t|
      t.rename :tag_id, :page_id
    end
  end

  def down
    change_table :workshops do |t|
      t.rename :page_id, :tag_id
    end
  end
end
