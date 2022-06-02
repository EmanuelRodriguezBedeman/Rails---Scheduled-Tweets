class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = user.find_by(email: params[:email])

        if @user.present?
            # Send email
            PasswordMailer.with(user: @user).reset.deliver_later
        end

        redirect_to root_path, notice: "If an account with that email was found, we have sent to reset your password."
    end
end