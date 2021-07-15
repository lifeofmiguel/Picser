class ImagesController < ActionController::Base

    before_action

    def index
        @image = Image.order(created_at: :desc).limit(10)
    end

    def show
        @image = Image.find(params[:id])
    end

    def new
        @image = Image.new
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

    def edit
        @image = Image.find_by_id(params[:id])
        render :edit
    end

    def destroy
        @image = Image.find(params[:id]).destroy
        redirect_to '/images'

    end

    private

    def image_params
        params.require(:image).permit(:image, :caption)
    end

end