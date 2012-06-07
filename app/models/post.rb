class Post < ActiveRecord::Base
  attr_accessible :tags, :content, :name, :avatar, :avatar_cache
  
  has_many :comments, :dependent => :destroy
  
 acts_as_taggable
 acts_as_taggable_on :skills, :interests
end
