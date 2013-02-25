class Tag < ActiveRecord::Base
  attr_accessible :description, :title, :parent_id
  has_many :articles

  has_ancestry
end
