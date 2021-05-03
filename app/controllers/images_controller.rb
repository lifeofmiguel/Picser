class ImagesController < ActionController::Base

    def index
        @images = Image.all
    end

    def create
        @images = Image.create(image_params)
        if @image .save
            redirect images_path(@image.id). notice: "Image successfully uploaded!"
        else
            render :new
        end
    end

    def destroy
        @images = Image.find(params[:id]).destroy
    end

    def show
        @images = Image.find(params[:id])
    end

    private

    def image_params
        params.require(:image).permit(:image, :description)
    end

end