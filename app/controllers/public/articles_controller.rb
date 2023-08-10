class Public::ArticlesController < ApplicationController

  def index

  end

  def prefecture
    if params[:prefecture_name]
      @tokyo = Article.where(prefecture: params[:prefecture_name] ,is_deleted: false)
    else
      @tokyo = Article.where(is_deleted: false)
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def search
    @articles = Article.all.search(params[:keyword])
  end

end
