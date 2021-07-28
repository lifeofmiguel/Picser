class ImagesController < ActionController::Base

    protect_from_forgery with: :null_session

    before_action :authenticate_account!
    before_action :find_images, only: [:show, :edit, :update, :destroy]

    def index
        @image = Image.order(created_at: :desc).limit(10)
    end

    def show
        @comment = Comment.new(image_id:params[:id])
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
    end

    #from Sav
    def update
        if @image.update(image_params)

            redirect_to account_image_path(current_account, @image)
        else
            @image.errors.full_messages
            
            render :edit
        end
    end

    # from eri
    # def update
    #     @image = Image.find_by(id: params[:id])
    #     @image.update(image_params)

    #     if @image.valid?
    #         redirect_to image_path(@image.id)
    #     else
    #         #TODO: ERROR MESSAGES
    #         render :edit
    #     end
    # end

    # def destroy
    #     @image = Image.find(params[:id]).destroy
    #     redirect_to '/images'
    # end

    def destroy
        @image = Image.find_by(id: params[:id])
        @image.destroy
        redirect_to images_path
    end

    private
    def find_images
        @image = Image.find(params[:id])
    end


    def image_params
        params.require(:image).permit(:image, :caption)
    end

end