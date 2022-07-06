class User::UsersController < ApplicationController

	def login
		@user = User.where(email: params[:email], password: params[:password]).last 
		if @user
			render json: {token: @user.token}
		else
			render json: {error: "User_does_not_exist"}
		end
	end

	def register
		@user = User.new(user_params(params[:user])) 
		if @user.save
			render json: {token: @user.token}
		else
			render json:{error: "registration_error"}
		end	
	end	

	private

	def comprobate_token
		@user = User.where(token: params[:token]).last
		unless @user
			head 403
		end
	end

	def user_params params
    params.permit(
    	:email,
      :password
    ) 
  end	

end	