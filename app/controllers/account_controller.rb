class AccountController < ApplicationController

    #protect_from_forgery with: :null_session

    #skip_before_action :verify_authenticity_token

    def show
        #@account = Account.find_by(username: params[:username])
        @images = @account.images.order(created_at: :desc)
    end
end
