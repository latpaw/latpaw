class RecentCell < Cell::Rails

  def display
    @posts = Post.paginate(:page=>params[:page],:per_page=>10).order('created_at DESC')
    render
  end

end
