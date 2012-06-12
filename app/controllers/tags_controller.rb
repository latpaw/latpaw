class ActsAsTaggableOn::TagsController < ApplicationController
def index
end
    

   def destroy
    @tag = Tag.find(params[:tag_id])
   end
end

