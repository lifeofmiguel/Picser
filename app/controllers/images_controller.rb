class ImagesController < ActionController::Base

    def new
        @image = Image.new
      end

    def index
        @image = Image.order(created_at: :desc).limit(10)
    end

    def create
        @image = current_account.images.build(image_params)
        # @image = Image.create(image_params)
        # @image.user_id = current_user.id
        if @image.save
            redirect_to image_path(@image.id) 
            #flash.notice = "Image successfully uploaded!"
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
        params.require(:image).permit(:caption)
    end

end