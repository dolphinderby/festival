class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      redirect_to admin_article_path(@article.id)
    else
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @customers = Customer.all
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
    params.require(:article).permit(:name, :sub_title, :introduction, :prefecture, :venue, :event_date, :image, :is_deleted, tag_ids: [])
  end

end
