class ArticlesController < ApplicationController
  layout nil
  layout 'application', :except => :view

 def index
    @articles = Article.all
    @topics = Topic.all
    @story = Article.all.reverse 
    @staff = current_staff
    @current_subscriber = current_subscriber
    @current_staff = current_staff

  end

  def new
    @articles = Article.new
    @topic = Topic.all
@current_subscriber = current_subscriber
    @current_staff = current_staff
  end


  def create
   @topic = Topic.all
   topics =  params[:topics]
   @article = Article.create(article_params)
   @article.staff = current_staff
   @article.save
   @current_subscriber = current_subscriber
   @current_staff = current_staff

     topics.each do |t|
      @article.topics.push(Topic.find(t))

    end

    # if @articles.save
    #   flash[:notice] = "Your account has been created."
    
    redirect_to (:back)
    # else
    #   flash[:alert] = "There was a problem saving your account."
    #   redirect_to articles_path_new
    # end
  end

  def categorize
    @join = Article_topics.create() 
  @current_subscriber = current_subscriber
    @current_staff = current_staff
  end

  def edit
    @current_subscriber = current_subscriber
    @current_staff = current_staff

  end

  def update
    @current_subscriber = current_subscriber
    @current_staff = current_staff
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.where(article_id: params[:id])
    @current_subscriber = current_subscriber
    @current_staff = current_staff
  end

  def destroy
  
  @a = params[:id]
  association = ArticleTopic.where(article_id: @a)
  association.delete_all

    target = Article.find_by_id(@a)
    target.destroy
    
    redirect_to (:back)
  end

  private   

# this provdes additional security by only allowing the permitted variables to be accessed and changed.

  def article_params
    params.require(:article).permit(:title, :body, :image_url, topics_attributes: [ :id, :category ])
  end
end