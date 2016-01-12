class CommentsController < ApplicationController
  

  def create
    
    @comment = Comment.create(article_id: params[:article_id], feedback: params[:feedback], subscriber_id: session[:subscriber_id])
  
    redirect_to (:back)
  end

  def edit
  end

 

  def destroy
  @a = params[:id]
  association = Comment.where(id: @a)
  association.delete_all
  redirect_to (:back)

  end

 private   

# this provdes additional security by only allowing the permitted variables to be accessed and changed.

  def comment_params
    params.require(:comment).permit(:feedback)
  end




end
