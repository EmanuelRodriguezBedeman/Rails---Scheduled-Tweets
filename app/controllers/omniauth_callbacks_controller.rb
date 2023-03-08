class OmniauthCallbacksController < ApplicationController
    def twitter
        
        begin
            twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
            twitter_account.update(
                name: auth.info.name,
                image: auth.info.image,
                token: auth.credentials.token,
                secret: auth.credentials.secret,
            )
    
            redirect_to twitter_accounts_path, notice: "Successfully connected your account."
        rescue
            redirect_to log_in_path, alert: "You must be logged in to do that."
        end
    end

    def auth
        request.env['omniauth.auth']
    end
end