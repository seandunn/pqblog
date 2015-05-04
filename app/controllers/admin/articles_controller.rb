class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.save
    redirect_to article
  end
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
  private :article_params

end
