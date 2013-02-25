class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.boolean :public
      t.string :type
      t.datetime :publication_date
      t.string :imagen

      t.timestamps
    end
  end
end
