class RecentCell < Cell::Rails

  def display
    @posts = Post.all(:order=>:id)
    render
  end

end
