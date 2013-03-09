class Page < ActiveRecord::Base
  attr_accessible :description, :title, :parent_id, :link, :position, :public
  has_many :workshops

  has_ancestry
  # acts_as_list scope: [:ancestry]

  scope :ordered, lambda{ order(:position)}
  scope :published, where(:public=>true)

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def to_s
    title
  end

  def self.move_higher(current_item, ancestry = false)
    higher_item = self.higher_item(current_item, ancestry)
    self.change_position(current_item, higher_item)
  end

  def self.move_lower(current_item, ancestry = false)
    lower_item = self.lower_item(current_item, ancestry)
    self.change_position(current_item, lower_item)
  end

  def self.change_position(item_a, item_b)
    a_position = item_a.position
    b_position = item_b.position
    item_a.position = b_position
    item_b.position = a_position
    [item_a, item_b].each do |item|
      item.save
    end
  end

  def self.lower_item(current_item, ancestry = true)
    if ancestry
      value_ancestry = current_item.ancestry || nil
      lower_item = Page.where(:ancestry=>value_ancestry).order(:position).where("position > #{current_item.position}").first
    else
      lower_item = Page.where("position > #{current_item.position}").first
    end
  end

  def self.higher_item(current_item, ancestry = true)
    if ancestry
      value_ancestry = current_item.ancestry || nil
      higher_item = Page.where(:ancestry=>value_ancestry).order(:position).where("position < #{current_item.position}").last
    else
      higher_item = Page.where("position < #{current_item.position}").last
    end
  end
end
