class CommentsController < ApplicationController
  

  def create
    # Source_article = params[:article_id]
    # puts Source_article
    # puts "**************"
    @comment = Comment.create(article_id: params[:article_id], feedback: params[:feedback], subscriber_id: session[:subscriber_id])
    

    redirect_to (:back)
    # redirect '/articles'

    # article_id = Article.find(params[:article_id])
    # comment = Comment.create(params[:feedback])
    # comment.subscriber_id = subscriber.id
    # article_id.comments.push(comment)
    # puts "*****************************"
    # puts @comment
    # puts "*****************************"
    # redirect_to (:back)

  end

  def edit
  end

 

  def destroy
  end

 private   

# this provdes additional security by only allowing the permitted variables to be accessed and changed.

  def comment_params
    params.require(:comment).permit(:feedback)
  end




end
