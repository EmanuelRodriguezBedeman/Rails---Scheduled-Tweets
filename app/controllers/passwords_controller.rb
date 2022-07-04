# Before calling the class methods, we have to make sure the user is logged in.

class PasswordsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :password_params, only: [:update]

    def edit
    end

    def update

        puts("Hello from update!")

        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password updated!"
        else
            render :edit
        end
    end

    private

    def password_params
        puts("Hello from password_params!")

        puts params
        
        puts("\n↓↓ Start of params inspect ↓↓ \n\n")
        
        puts params.inspect

        puts("\n↑↑ End of params inspect ↑↑ \n\n")
        params.permit(user: [:password, :repeat_password])
    end
end