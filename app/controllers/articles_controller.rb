class ArticlesController < ApplicationController
 def index
    @articles = Article.all
    @topics = Topic.all
    @story = Article.all.reverse 
    @staff = current_staff

  end

  def new
    @articles = Article.new
    @topic = Topic.all

  end


  def create
    topics =  params[:topics]
    @article = Article.create(article_params)
    @article.staff = current_staff
    @article.save

    topics.each do |t|
      @article.topics.push(Topic.find(t))
    end

    # if @articles.save
    #   flash[:notice] = "Your account has been created."
    
    redirect_to article_path @article
    # else
    #   flash[:alert] = "There was a problem saving your account."
    #   redirect_to articles_path_new
    # end
  end

  def categorize
    @join = Article_topics.create() 
  
  end

  def edit

  end

  def update
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.where(article_id: params[:id])
  end

  def destroy

  end

  private   

# this provdes additional security by only allowing the permitted variables to be accessed and changed.

  def article_params
    params.require(:article).permit(:title, :body, :image_url, topics_attributes: [ :id, :category ])
  end
end
