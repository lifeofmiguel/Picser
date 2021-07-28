class CommentsController < ApplicationController

    protect_from_forgery with: :null_session

    def new
        @comment = Comment.new(params[:post])
    end

    def create
        #binding.pry
        @image = Image.find(params[:comment][:image_id]) 
        #@image = Image.find(params[:image_id])
        
        @comment = @image.comments.new(params[:comment].permit(:name, :body, :account_id, :image_id))
        @comment.save
        #binding.pry
        redirect_to image_path(@image)
        #redirect_to Image.find(params[:image_id]
    end

    # #from Jean
    # def create
    #     @image = Image.find_by_id(params[:image_id])
    #     @comment = @image.comment.build(comment_params)
    #     if @comment.save
    #         #flash[:message] = "Comment Added"
    #         redirect_to image_path(@image)
    #     else
    #        # flash[:message] = @comment.errors.full_messages.to_sentence
    #         render :new
    #     end
    # end


    # def index
    #     @image = Image.find_by_id(params[:image_id])
    #     @comments = @image.comments
    # end

    def show
        #must have show method to show use of has many through method
        @image = Image.find_by(id: params[:id])
        @comment = @image.comments.find_by(params [:image_id])
    end




    def destroy
        @image = Image.find(params[:image_id])
        @comment = @image.comments.find(params[:id])
        @comment.destroy
        redirect_to image_path(@image)
        #redirect_to image_path(@image.id) 
        redirect_to image_path
    end

    private 

    def comment_params
        params.require(:image, :body, :comment).permit(:image, :body, :comment)
    end
end
