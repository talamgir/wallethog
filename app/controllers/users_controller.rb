class UsersController < ApplicationController

	def form
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Welcome!"
			redirect_to users_confirmation_path
		else
			flash[:alert] = @user.errors.full_messages
			redirect_to '/form'
		end
	end

	def confirmation
		@user = User.find_by(id: session[:user_id])
	end

	private
	def user_params
    	params.require(:user).permit(:email, :phone, :fname, :lname, :balance)
  	end
end
