class Workshop < ActiveRecord::Base
  attr_accessible :content, :menu, :public, :summary, :title, :page_id
  has_many :event_dates, :as => :event_dateable
  belongs_to :page

  # scope :published, where(:public=>true).where("publication_date is null or publication_date < ?", Time.now)
  scope :published, where(:public=>true)
  scope :in_menu, where("menu is not null and menu > 0").order(:menu).limit(5)

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def to_s
    title
  end

end
