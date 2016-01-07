class ArticlesController < ApplicationController
 def index
    @articles = Article.all

  end

  def new
    @articles = Article.new
    @topic = Topic.all

  end

  def create

    puts "*******************"
    puts params

    @articles = Article.create(article_params)

    # if @articles.save
    #   flash[:notice] = "Your account has been created."
      redirect_to articles_path
    # else
    #   flash[:alert] = "There was a problem saving your account."
    #   redirect_to articles_path_new
    # end
  end

  def edit

  end

  def update
  end

  def show
  end

  def destroy

  end

  private   

# this provdes additional security by only allowing the permitted variables to be accessed and changed.

  def article_params
    params.require(:article).permit(:title, :body, :image_url, topics_attributes: [ :id, :category ])
  end
end
