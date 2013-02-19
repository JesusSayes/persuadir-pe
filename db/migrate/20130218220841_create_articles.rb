class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.integer :menu
      t.boolean :public

      t.timestamps
    end
  end
end
