class Article < ActiveRecord::Base
  attr_accessible :content, :menu, :public, :summary, :title
end
