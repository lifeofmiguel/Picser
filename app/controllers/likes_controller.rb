class LikesController < ApplicationController
    before_action :find_images

    def new 
        @like = Like.new
    end

    def create
            @image.likes.create(account_id: current_account.id)
            # redirect_to 
    end

    def destroy
        @like.destroy
        # redirect_to 
    end

    private

    def find_images
        @image = Image.find(params[:image_id])
    end

    
    