class Post < ActiveRecord::Base
  attr_accessible :tag_list, :content, :name, :video2, :userid
  attr_accessor :video_file_name
  has_many :comments, :dependent => :destroy
  
 acts_as_taggable
 acts_as_taggable_on :skills, :interests

 mount_uploader :video, VideoUploader

 #has_attached_file :video2, :styles => {
 #	:medium => {:geometry =>"640x480",:format=>"webm"},
 #	:thumb => {:geometry =>"100x100#",:format=>"gif",:time=>"10"}
 #},:processors =>[:ffmpeg]

end
