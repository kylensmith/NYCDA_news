class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_topics
  
  def current_staff
    session[:staff_id] ? User.find(session[:staff_id]) : nil
  end

  def current_subscriber
    session[:subscriber_id] ? User.find(session[:subscriber_id]) : nil
  end


  def get_topics
     @topics = Topic.all
  end
end
