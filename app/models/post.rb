class Post < ActiveRecord::Base
  attr_accessible :tag_list, :content, :name, :avatar, :avatar_cache, :userid
  
  has_many :comments, :dependent => :destroy
  
 acts_as_taggable
 acts_as_taggable_on :skills, :interests
end
