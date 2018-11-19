class ArticlesController < ApplicationController
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
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(sign_up_params)
      flash[:notice] = "successfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private
  def sign_up_params
    params.require(:article).permit(:title, :description)
  end
end