class AccountsController < ApplicationController

    protect_from_forgery with: :null_session

    #skip_before_action :verify_authenticity_token
    def index
        @accounts = Account.all
    end

    def show
        #@account = Account.find_by(username: params[:username])
        @images = @account.images.order(created_at: :desc)
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
