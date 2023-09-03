class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.page(params[:page])
    @tag = Tag.new
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    #@tag.admin_id = current_admin.id
    if @tag.save!
      redirect_to admin_tags_path
    else
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
