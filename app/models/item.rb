class Item < ActiveRecord::Base
  strip_attributes

  has_many :pics

  attr_accessible :title, :text, :position

  before_validation :initialize_position

  validates :title, :presence => true, :uniqueness => true
  validates :text, :presence => true
  validates :position, :presence => true

  scope :by_position, order("position asc")

  def initialize_position
    self.position ||= Item.minimum(:position).to_i - 1
  end

  def to_param
    "#{id}-#{title.to_url}"
  end
end
