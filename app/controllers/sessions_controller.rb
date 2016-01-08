class SessionsController < ApplicationController
	# enable :sessions
	# set :sessions, true

	def create


		@user = Staff.find_by_email(params[:email]) 
		if @user and @user.password == params[:password]
			session[:staff_id] = @user.id 
			redirect_to articles_path
		else 
			@user = Subscriber.find_by_email(params[:email]) 
			if @user and @user.password == params[:password]
				session[:subscriber_id] = @user.id 
				redirect_to subscribers_path
			else
				flash[:alert] = "There was a problem, please try again."
				render :new
			end
		end
	end

	

	# def destroy_subscriber
	# 	session[:subscriber_id] = nil
	# 	redirect_to root_path, notice "You have been logged out."

	# end

	def destroy
		session[:staff_id] = nil
		session[:subscriber_id] = nil
		redirect_to root_path
		
	end




end
