class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
