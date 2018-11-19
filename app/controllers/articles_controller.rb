class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(sign_up_params)
    if @article.save
      flash[:notice] = 'article was successfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def update
    if @article.update(sign_up_params)
      flash[:notice] = "successfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "article has been deleted"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def sign_up_params
    params.require(:article).permit(:title, :description)
  end
end