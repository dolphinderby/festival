class Public::NicesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    nice = current_customer.nices.new(article_id: article.id)
    nice.save
    redirect_to article_path(article)
  end

  def destroy
    article = Article.find(params[:article_id])
    nice = current_customer.nices.find_by(article_id: article.id)
    nice.destroy
    redirect_to article_path(article)
  end
end
