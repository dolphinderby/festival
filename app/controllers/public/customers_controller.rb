class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:nices]

  def show
    @customer = current_customer
  end

  def edit
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

  def nices
    #nices = Nice.where(customer_id: @customer.id).pluck(:article_id)
    #@nices = Article.find(nices)
    @articles = @customer.articles
    byebug
  end

  def note
    @articles = @customer.articles
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :image)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
