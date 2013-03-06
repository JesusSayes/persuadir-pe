class EventDate < ActiveRecord::Base
  attr_accessible :description, :event_date, :event_dateable_id, :event_dateable_type
  belongs_to :event_dateable, :polymorphic => true
  belongs_to :workshop
end
