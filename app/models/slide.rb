class Slide < ActiveRecord::Base
  attr_accessible :description, :public, :title
  has_many :images, :as => :imageable

end
