class Consultant < ActiveRecord::Base
  attr_accessible :charge, :description, :image, :name, :public

  mount_uploader :image, ImageUploader

  scope :published, lambda{where(:public=>true)}
end
