module PostsHelper

def markdown 
  Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :autolink => true, :space_after_headers => true)
end

include ActsAsTaggableOn::TagsHelper

  def reply(comment,post)
     fromid = comment.fromid
     comment_from = post.comments.find(fromid) rescue nil if fromid
     comment_from.commenter if comment_from
  end
end
