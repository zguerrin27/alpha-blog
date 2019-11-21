class ArticlesController < ApplicationController 

  before_action :set_article, only: [:edit, :update, :show, :destroy]   # this pulls private method set_article

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first              # hard code user for now 
    if @article.save
      flash[:success] = "Article was saved to Database"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
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
    flash[:danger] = "Article was successfully deleted"
  end 

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end 