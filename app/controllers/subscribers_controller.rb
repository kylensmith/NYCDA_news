class SubscribersController < ApplicationController
 
 def index
    @subscribers = Subscriber.all
    @current_subscriber = current_subscriber
@current_staff = current_staff
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.create(subscriber_params)
    if @subscriber.save
      flash[:notice] = "Your account has been created."
      redirect_to subscribers_path
    else
      flash[:alert] = "There was a problem saving your account."
      redirect_to subscribers_path_new
    end
  end

  def edit

  end

  def update
  end

  def show
    @current_subscriber = current_subscriber
    @current_staff = current_staff
  end

  def destroy

  end


  private   

# this provdes additional security by only allowing the permitted variables to be accessed and changed.

  def subscriber_params
    params.require(:subscriber).permit(:id, :fname, :lname, :email, :password, :city, :state)
  end

end
