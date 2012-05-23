class Post < ActiveRecord::Base
  attr_accessible :content, :name
  
  has_many :comments, :dependent => :destroy

end
