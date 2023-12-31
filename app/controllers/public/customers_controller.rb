class Public::CustomersController < ApplicationController

  def show
    @tags = Tag.all
    @customer = current_customer
  end

  def edit
    @tags = Tag.all
    @customer = current_customer
  end

  def update
   @customer = current_customer
   if @customer.update(customer_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to customers_my_page_path(@customer.id)
   else
      render :edit
   end
  end

  def confirm
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def nice
    @tags = Tag.all
    @articles = current_customer.nice_articles.where(is_deleted: false)
  end

  def note
    @tags = Tag.all
    @articles = current_customer.note_articles
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :image)
  end

end
