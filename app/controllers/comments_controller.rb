class CommentsController < ApplicationController

    def create
        @post = Image.find(params[:image_id])
        @comment = @image.comments.create(params[:comment].permit(:name))
end
