class ImagesController < ActionController::Base

    def index
        @image = Image.all
    end

    def create
        @image = Image.create(image_params)
        if @image .save
            redirect images_path(@image.id). notice "Image successfully uploaded!"
        else
            render :new
        end
    end

    def destroy
        @image = Image.find(params[:id]).destroy
    end

    def show
        @image = Image.find(params[:id])
    end

    private

    def image_params
        params.require(:image).permit(:image, :caption)
    end

end