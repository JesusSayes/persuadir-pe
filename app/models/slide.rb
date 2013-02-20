class Slide < ActiveRecord::Base
  attr_accessible :description, :public, :title
  has_many :images, :as => :imageable

  scope :in_home, where(:public => true)

end
