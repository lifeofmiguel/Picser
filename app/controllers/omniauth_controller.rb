class OmniauthController < ApplicationController

    def google_oauth2
        @account = Account.create_from_provider_data(request.env['omniauth.auth'])
        if @account.persisted?
            sign_in_and_redirect @account
            set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
        else
           # flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later'
            redirect_to new_account_registration_url
        end
    end

    def failure
        flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later'
        redirect_to new_account_registration_url
    end
end