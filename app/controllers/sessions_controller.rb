class SessionsController < ApplicationController
	# enable :sessions
	# set :sessions, true

	def create


		@user = Staff.find_by_email(params[:email]) 
		if @user and @user.password == params[:password]
			session[:staff_id] = @user.id 
			flash[:alert] = "There was a problem, please try again."
			redirect_to (:back)
		else 
			@user = Subscriber.find_by_email(params[:email]) 
			if @user and @user.password == params[:password]
				session[:subscriber_id] = @user.id 
				flash[:alert] = "There was a problem, please try again."
				redirect_to (:back)
			else
				flash[:alert] = "There was a problem, please try again."
				redirect_to (:back)
			end
		end
	end

	

	def destroy
		session[:subscriber_id] = nil
		session[:staff_id] = nil
		redirect_to articles_path
	end

	def destroy
		session[:staff_id] = nil
		session[:subscriber_id] = nil
		redirect_to articles_path
		
	end




end
