class CommentsController < ApplicationController

    def create
        @post = Image.find(params[:image_id])
        @comment = @image.comments.create(params[:comment].permit(:name, :body))
        redirect_to post_path(@image)
    end

    def destroy
        @image = Image.find(params[:image_id])
        @comment = @image.comments.find(params[:id])
        @comment.destroy
        redirect_to image_path(@image)
    end
end
