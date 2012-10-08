class CommandsController < ApplicationController

layout "comm_lay"
 # load_and_authorize_resource
 # #  skip_authorize_resource :only=> :tag

 #  def tag
 #    @commands = command.tagged_with(params[:tag_id])
 #  end
  
 #  def add_tag
 #    @command = command.find(params[:id])
 #    @command.tag_list.add(params[:tag_id])
 #    if @command.save
 #      @tag = @command.tags.where(:name=>params[:tag_id])
 #      respond_to do |format|
 #        format.js
 #      end
 #    end
 #  end

 #  def remove
 #    @command = command.find(params[:id])
 #    @tag = @command.tags.where(:name=>params[:tag_id]).first
 #    @tag.destroy
 #    # repond_to do |format|  why unable to with these code
 #    #   format.js 
 #    # end
 #  end

  def index
    @commandss = Command.all
    @commands = Command.paginate(:page=>params[:page],:per_page=>10).order('created_at desc')
    @command = Command.new

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @commands }
      format.rss { render :layout => false }
    end
  end



  # GET /commands/1
  # GET /commands/1.json
  def show
    # @commandss = Command.all
    @command = Command.find(params[:id])
    # @user = User.find(@command.userid) rescue User.first
    # @firstcommand = Command.order("created_at DESC").last
    # @lastcommand = Command.order("created_at DESC").first
    # @commandnext = @command.next
    # @precommand = precommand(@command) unless @command.id == 1
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @command }
    end
  end

 def precommand(pst)
   (1..100).map {|i| return precommand = command.find(pst.id - i) if command.exists?(pst.id - i)}
 end


  # GET /commands/new
  # GET /commands/new.json
  # def new
  #   @command = Command.new
 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @command }
  #   end
  # end

  # GET /commands/1/edit
  def edit
    @command = Command.find(params[:id])
  end

  # command /commands
  # command /commands.json
  def create
    @command = Command.new(params[:command])

    respond_to do |format|
      if @command.save
        format.js# { redirect_to "/commands", notice: 'command was successfully created.' }
        # format.json { render json: @command, status: :created, location: @command }
      else
        format.html { render action: "new" }
        format.json { render json: @command.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /commands/1
  # PUT /commands/1.json
  def update
    @command = Command.find(params[:id])

    respond_to do |format|
      if @command.update_attributes(params[:command])
        format.html { redirect_to @command, notice: 'command was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @command.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commands/1
  # DELETE /commands/1.json
  def destroy
    @command = Command.find(params[:id])
    @command.destroy

    respond_to do |format|
      format.html { redirect_to commands_url }
      format.json { head :no_content }
    end
  end
end
