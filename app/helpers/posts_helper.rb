module PostsHelper



def markdown 
  Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :autolink => true, :space_after_headers => true)
end

include ActsAsTaggableOn::TagsHelper

  def reply_to(comment,post)
     fromid = comment.fromid
     comment_from = post.comments.find(fromid) rescue nil if fromid
     comment_from.commenter if comment_from
  end

  require "mime/types"
   def image_or_video(path)
      type = MIME::Types.type_for(path)
      return "image" if type.index("image")
      return "video" if type.index("video")
   end
 
  def allcomments
     unread = 0
     @posts = Post.where("userid = #{current_user.id}").find(:all)
     @comms = @posts.map {|post| post.comments.count }
     return allcomments = @comms.sum {|c| c}
     # @posts.map do |post|
     #      post.comments.map do |c|
     #        if c.fromid == nil
     #          unread = unread + 1
     #        end
     #     end
     #   end
  end

end
