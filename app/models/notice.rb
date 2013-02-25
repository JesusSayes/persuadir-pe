class Notice < ActiveRecord::Base
  attr_accessible :content, :imagen, :public, :publication_date, :summary, :title, :type
end
