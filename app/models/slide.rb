class Slide < ActiveRecord::Base
  attr_accessible :description, :public, :title
  has_many :images, :as => :imageable

  scope :in_home, where(:public => true)

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def to_s
    title
  end
end
