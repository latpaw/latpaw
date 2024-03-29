class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json


 load_and_authorize_resource
 #  skip_authorize_resource :only=> :tag

  def tag
    @posts = Post.tagged_with(params[:tag_id])
  end
  
  def add_tag
    @post = Post.find(params[:id])
    @post.tag_list.add(params[:tag_id])
    if @post.save
      @tag = @post.tags.where(:name=>params[:tag_id])
      respond_to do |format|
        format.js
      end
    end
  end

  def remove
    @post = Post.find(params[:id])
    @tag = @post.tags.where(:name=>params[:tag_id]).first
    @tag.destroy
    # repond_to do |format|  why unable to with these code
    #   format.js 
    # end
  end

  def index
    @postss = Post.all
    @posts = Post.paginate(:page=>params[:page],:per_page=>10).order('created_at DESC')
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.rss { render :layout => false }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  include PostsHelper  #  #call for methods in helper
  def show
    @postss = Post.all
    @post = Post.find(params[:id])
    @user = User.find(@post.userid) rescue User.first
    @firstpost = Post.order("created_at DESC").last
    @lastpost = Post.order("created_at DESC").first
    @postnext = @post.next
    @prepost = prepost(@post) unless @post.id == 1
    markdown_post = @post
    markdown_post.content = markdown(@post.content)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: markdown_post }
    end
  end

 def prepost(pst)
   (1..100).map {|i| return prepost = Post.find(pst.id - i) if Post.exists?(pst.id - i)}
 end


  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
