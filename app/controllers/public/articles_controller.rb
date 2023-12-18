class Public::ArticlesController < ApplicationController

  def index
    @tags = Tag.all
  end

  def prefecture
    @tags = Tag.all
    if params[:prefecture_name]
      @prefecture = Article.where(prefecture: params[:prefecture_name] ,is_deleted: false)
    else
      @prefecture = Article.where(is_deleted: false)
    end
  end

  def tag_articles
    @tags = Tag.all
    @articles = Article.includes(:post_tags).where(post_tags: {tag_id: params[:tag]},is_deleted: false)
    #@customer = Article.includes(:customer).where(customers: {first_name: "taro"})
  end

  def show
    @article = Article.find(params[:id])
    if @article.is_deleted == true
      redirect_to root_path
    else
      @tags = Tag.all
      @active_comments = @article.comments.active_comments
      @comment = Comment.new
    end
  end

  def search
    @tags = Tag.all
    @articles = Article.page(params[:page]).search(params[:keyword] )
  end

end
