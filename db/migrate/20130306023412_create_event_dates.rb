class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.datetime :event_date
      t.text :description
      t.integer :event_dateable_id
      t.string :event_dateable_type

      t.timestamps
    end
  end
end
