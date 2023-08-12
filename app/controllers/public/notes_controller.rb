class Public::NotesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    note = current_customer.notes.new(article_id: article.id)
    note.save
    redirect_to article_path(article)
  end

  def destroy
    article = Article.find(params[:article_id])
    note = current_customer.notes.find_by(article_id: article.id)
    note.destroy
    redirect_to article_path(article)
  end
end
