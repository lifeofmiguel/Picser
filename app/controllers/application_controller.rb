class ApplicationController < ActionController::Base
    before_action :authenticate_account!

    def index
        #feed
    end

    def show
        #profile
    end

end
