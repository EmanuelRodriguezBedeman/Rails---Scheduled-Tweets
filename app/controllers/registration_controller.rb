class RegistrationController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id # To save the session and keep the user logged in
            redirect_to root_path, notice: "Succesfully created account"
        else
            render :new
        end
    end

    private 

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end