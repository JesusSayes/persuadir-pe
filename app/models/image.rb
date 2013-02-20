# coding: utf-8
class Image < ActiveRecord::Base
  attr_accessible :description, :image, :imageable_id, :imageable_type, :link, :title, :user_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :slide
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates_format_of :link, :with =>
  /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix ,
                      :message => "El URL es inválido. http://ejemplo.com ",
                      :allow_blank => true

  def to_s
    title
  end

end
