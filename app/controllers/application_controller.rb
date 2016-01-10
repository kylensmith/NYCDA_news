class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_topics
  

  def get_topics
     @topics = Topic.all
 end

def current_subscriber
	if session[:subscriber_id]
		@current_subscriber = Subscriber.find(session[:subscriber_id])
	end
end

def current_staff
	if session[:staff_id]
		@current_staff = Staff.find(session[:staff_id])
	end
end

end
