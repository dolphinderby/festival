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

  def tag_articles
    @articles = Article.includes(:post_tags).where(post_tags: {tag_id: params[:tag]})
    #@customer = Article.includes(:customer).where(customers: {first_name: "taro"})
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def search
    @articles = Article.all.search(params[:keyword] )
  end

end
