class RenameTagToPage < ActiveRecord::Migration
  def up
    rename_table :tags, :pages
  end

  def down
    rename_table :pages, :tags
  end
end
