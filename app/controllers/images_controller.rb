class ImagesController < ActionController::Base

    def index
        @images = Image.all
    end

    def create
        @images = Image.create()
    end

    def destroy
        @images = Image.find(params[:id]).destroy
    end

end