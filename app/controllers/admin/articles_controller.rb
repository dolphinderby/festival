class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(item_params)
    if @article.save
      redirect_to admin_article_path(@article.id)
    else
      render :new
    end
  end

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_article_path(@article.id)
    else
      render :edit
    end
  end

   private

  def article_params
    params.require(:article).permit(:name, :sub_title, :introduction, :prefecture, :venue, :event_day, :image)
  end

end
