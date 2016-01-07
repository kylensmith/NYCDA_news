class TopicsController < ApplicationController
  def index
    @topic = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    if @topic.save
      flash[:notice] = "Topic Created!"
      redirect_to topics_path
    else
      flash[:alert] = "Error!"
      redirect_to topics_path_new
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:type])
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:category)
  end

end
