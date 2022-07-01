# Before calling the class methods, we have to make sure the user is logged in.

class PasswordsController < ApplicationController
    before_action :require_user_logged_in!

    def edit
    end

    def update
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password updated!"
        else
            render :edit
        end
    end

    private 

    def password_params
        params.require.(:user).permit(:password, :repeat_password)
    end
end