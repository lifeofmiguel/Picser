class AccountController < ApplicationController
    def show
        #@account = Account.find_by(username: params[:username])
        @images = @account.images.order(created_at: :desc)
    end
end
