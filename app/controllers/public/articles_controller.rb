class Public::ArticlesController < ApplicationController

  def index
  end

  def prefecture
    @tokyo = Article.where(prefeture_name: "東京都" ,is_deleted: false)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

end
