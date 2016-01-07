class SessionsController < ApplicationController
	enable :sessions
	set :sessions, true

	def create_staff
		

		@staff = Staff.find_by_email(params[:email]) 
		if @staff and @staff.password == params[:password]
			session[:staff_id] = @staff.id 
			redirect_to article_path_new
		else
			flash[:alert] = "There was a problem, please try again."
			render :new
		end
	end

	def create_subscriber
		

		@subscriber = Subscriber.find_by_email(params[:email]) 
		if @subscriber and @subscriber.password == params[:password]
			session[:subscriber_id] = @subscriber.id 
			redirect_to root_path
		else
			flash[:alert] = "There was a problem, please try again."
			render :new
		end
	end

	def destroy_staff
		session[:staff_id] = nil
		redirect_to root_path, notice "You have been logged out."
	end

	def destroy_subscriber
		session[:subscriber_id] = nil
		redirect_to root_path, notice "You have been logged out."

	end

end
