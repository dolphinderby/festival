class Public::ArticlesController < ApplicationController

  def index
    @tags = Tag.all
  end

  def prefecture
    @tags = Tag.all
    if params[:prefecture_name]
      @tokyo = Article.where(prefecture: params[:prefecture_name] ,is_deleted: false)
    else
      @tokyo = Article.where(is_deleted: false)
    end
  end

  def tag_articles
    @tags = Tag.all
    @articles = Article.includes(:post_tags).where(post_tags: {tag_id: params[:tag]})
    #@customer = Article.includes(:customer).where(customers: {first_name: "taro"})
  end

  def show
    @tags = Tag.all
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def search
    @tags = Tag.all
    @articles = Article.all.search(params[:keyword] )
  end

end
