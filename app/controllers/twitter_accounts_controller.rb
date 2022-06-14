class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
        @twitter_accounts = Current.user.twitter_accounts.find(params[:id])
        @twitter_accounts.destroy
        redirect_to twitter_accounts_path, notice: "Successfully disconnected @#{@twitter_account.username}"
    end
    
end