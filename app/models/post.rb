class Post < ActiveRecord::Base
  attr_accessible :content, :name, :avatar, :avatar_cache
  
  has_many :comments, :dependent => :destroy
  
 
end
