class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      ArticleEmailJob.perform_later(@article)
      flash[:success] = 'Article successfully saved.'
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:info] = 'Article successfully updated.'
      redirect_to edit_admin_article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to admin_articles_path
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
  private :article_params

end
