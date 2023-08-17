class UsersController < ApplicationController
    
    def login
        @user = User.new
        @check = params[:param1]

    end

    def validate
        @allusers  = User.all
        @username = User.find_by(username: params[:users][:username])
        @pass = User.find_by(password: params[:users][:password])
        if !(@username.class == NilClass) && !(@pass.class == NilClass)
            redirect_to home_path(param1: @username.id)
        else
            @check = true
            # render :login

            redirect_to login_path(param1: true)
        end
    end

    def signup
        @user = User.new
        @check = params[:param1]
    end

    def adduser
        # @user = Content.new(
        #     username: params[:users][:username],
        #     password: params[:users][:password],
        #     mobile: params[:users][:mobile]
        # )

        @user = User.new(users_params)
        @username = User.find_by(username: params[:users][:username])
        @mobile = User.find_by(mobile: params[:users][:mobile])
        if (@username.class == NilClass) && (@mobile.class == NilClass)
            if @user.save
                redirect_to login_path
            else
                render :signup, status: :unprocessable_entity
            end
        else
            # render :signup
            redirect_to signup_path(param1: true)
        end
    end
    
    # Use callbacks to share common setup or constraints between actions.

    private
    def users_params
        params.require(:users).permit(:username, :password, :mobile)
    end

end