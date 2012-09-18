class CommListCell < Cell::Rails
	def commlist
       @commands = Command.paginate(:page=>params[:page],:per_page=>10).order('created_at DESC')
       render
    end
end
