class ArticlesController < ApplicationController 

  before_action :set_article, only: [:edit, :update, :show, :destroy]   # this pulls private method set_article

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was saved to Database"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else 
      render 'edit'
    end
  end

  def show
    #@article = Article.find(params[:id])
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "Article was successfully deleted"
  end 

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end 