class CommentsController < ApplicationController

    protect_from_forgery with: :null_session

    def create
        @findimages = Image.find(params[:item_id]) if params[:item_id]
        # @image = Image.find(params[:image_id])
        @comment = @image.comments.create(params[:comment].permit(:name, :body))
        redirect_to image_path(@image)
    end

    def destroy
        @image = Image.find(params[:image_id])
        @comment = @image.comments.find(params[:id])
        @comment.destroy
        redirect_to image_path(@image)
    end

    private 

    def comment_params
        params.require(:image, :body, :comment).permit(:image, :body, :comment)
    end
end
