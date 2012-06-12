class TagcloudCell < Cell::Rails

  def tagcloud
    @tags = Post.tag_counts_on(:tags)
    render
  end

end
