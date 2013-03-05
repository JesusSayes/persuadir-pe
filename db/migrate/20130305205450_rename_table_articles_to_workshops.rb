class RenameTableArticlesToWorkshops < ActiveRecord::Migration
  def up
    rename_table :articles, :workshops
  end

  def down
    rename_table :workshops, :articles
  end
end
