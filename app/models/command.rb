class Command < ActiveRecord::Base
  attr_accessible :desc, :id, :name
  validates :name, :presence=>true
  validates :desc, :presence=>true
end
