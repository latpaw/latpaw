class Post < ActiveRecord::Base
  attr_accessible :tag_list, :content, :name, :video, :userid
  
  has_many :comments, :dependent => :destroy
  
 acts_as_taggable
 acts_as_taggable_on :skills, :interests

 mount_uploader :video, VideoUploader
end
