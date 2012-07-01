class Post < ActiveRecord::Base
  attr_accessible :tag_list, :content, :name, :video2, :userid, :file2

  has_many :comments, :dependent => :destroy
  
 acts_as_taggable
 acts_as_taggable_on :skills, :interests

 #mount_uploader :video, VideoUploader

 has_attached_file :video2, :url =>"/system/:class/video2s/:id/:style_:filename", :default_url => "" #, :styles => {
 	#:medium => {:geometry =>"640x480",:format=>"webm"},
 	#:thumb => {:geometry =>"100x100",:format=>"jpg",:time=>10}
 #},:processors =>[:ffmpeg]
 has_attached_file :file2, :url =>"/system/:class/video2s/:id/:style_:filename"

#### transcode after the video was uploaded
    #after_save :convert_in_webm
    #def convert_in_webm
      # webm = File.join(File.dirname(video2.path),"#{id}_convert.webm")
      # webm.gsub!(/original/,"medium")
      # system("/usr/bin/ffmpeg -i #{video2.path} -s 480x360 #{webm}")
      # update_attribute(:video2_file_name,"#{id}_convert.webm")
    #end
 
  ###permalink :title, :to_param => "#{:name}"


end
