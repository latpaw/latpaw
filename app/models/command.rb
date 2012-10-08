class Command < ActiveRecord::Base
  attr_accessible :desc, :id, :name, :command, :detail
  validates :name, :presence=>true
  validates :desc, :presence=>true
end
