class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @orders = Order.includes(:product).all
  end

  def show
    @order= Order.find(params[:id])
  end

  def new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      UserMailer.payment_confirmation(@order, @user).deliver
      redirect_to @user, notice: "Order Completed Successfully"
    end
  else
    render :new
  end


  def destroy
  end
end
