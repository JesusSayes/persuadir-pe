class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.boolean :public
      t.string :type_notice
      t.datetime :publication_date
      t.string :image

      t.timestamps
    end
  end
end
