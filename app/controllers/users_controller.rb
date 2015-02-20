class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		# Use Rails 4 strong parameters feature to prevent cross-site request forgery.
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the Sample App!"
			redirect_to user_url(@user)
		else
			render 'new'
		end
	end

	def show
		 @user = User.find(params[:id])
		 # Uncomment the following line to enable the rails server console debugger breakpoint.
		 #debugger
	end

	private

		def user_params
			# Specify which parameters are required and permitted.
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
