class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = article.comments.new(comment_params)
    comment.save
    redirect_to article
  end

  def comment_params
    params.require(:comment).permit(:screen_name, :body)
  end
  private :comment_params
end
