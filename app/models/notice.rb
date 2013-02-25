# coding: utf-8
class Notice < ActiveRecord::Base
  attr_accessible :content, :image, :public, :publication_date, :summary, :title, :type_notice
  has_many :images, :as => :imageable
  mount_uploader :image, ImageUploader

  TYPE_NOTICE = ["Noticia", "Artículo"]
end
