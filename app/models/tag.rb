class Tag < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :articles
end
