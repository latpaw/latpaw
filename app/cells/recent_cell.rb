class RecentCell < Cell::Rails

  def display
    @posts = Post.all
    render
  end

end
