# coding: utf-8
class Archive < ActiveRecord::Base
  attr_accessible :archive, :description
  mount_uploader :archive, FileUploader
  validates :archive, presence: true
end
