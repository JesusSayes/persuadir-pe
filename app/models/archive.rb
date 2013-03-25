# coding: utf-8
class Archive < ActiveRecord::Base
  attr_accessible :archive, :description
  mount_uploader :archive, FileUploader
  validates :archive, presence: true

  TYPES_FILES_IMAGES = %w{jpg png jpeg gif bmp}

  def self.type_of_file(myfile)
    mytype = File.extname(myfile.to_s).split(".")[1]
    mytype = mytype.downcase
    TYPES_FILES_IMAGES.include?(mytype) ? "image" : "file"
  end
end
