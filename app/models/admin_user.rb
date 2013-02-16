class AdminUser < ActiveRecord::Base
  acts_as_authentic
  strip_attributes

  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
end
