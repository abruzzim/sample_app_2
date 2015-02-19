class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		 @user = User.find(params[:id])
		 # Uncomment the following line to enable the rails server console debugger breakpoint.
		 #debugger
	end
  
end
