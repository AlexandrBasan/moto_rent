class OrdersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :check_if_user_has_company, only: []
  before_action :check_if_user_access, only: [:index]
  before_action :check_if_user_access_transactions, only: [:index]
  protect_from_forgery except: :pay_status_paypal
  before_action :current_user_check_nil, except: [:pay_status_paypal]

  def index
    respond_to do |format|
      format.html
      format.mobile
      # format json for android app
      format.json { render json: @orders }
      format.xml { render xml: @orders }
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    #@order.status = "wait"
    respond_to do |format|
      if @order.save
        format.html { redirect_to payment_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # Choise payment method
  def payment
    @last_top_up = Order.where(user_id: @user_company.id).first
    render 'payment_form'
  end

  # Check payment status PayPal
  # www.paypal.com
  def pay_status_paypal

  end

  # Check user role

  # Check if current user have company
  def check_if_user_has_company
    if @user_company.nil?
    else
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.access_deny_text'
    end
  end

  # Check if user have access
  def check_if_user_access
    if current_user && current_user.admin?
      @all_orders = Order.all
      @orders = @all_orders.paginate(page: params[:page])
    elsif current_user && current_user.role == "Partner"
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.your_company_not_verified'
    elsif current_user && current_user.role == "Client"
      @all_orders = @user_company.orders
      @orders = @all_orders.paginate(page: params[:page])
    else
    end
  end

  #Check if user have access for transaction
  def check_if_user_access_transactions
    if current_user && current_user.admin?
      @transactions = Transaction.paginate(page: params[:page])
    elsif current_user && current_user.role == "Partner"
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.your_company_not_verified'
    end
  end

  def current_user_check_nil
    if current_user.nil?
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.access_deny_text'
    else
    end
  end

  # Check user role
  def check_role_client
    if (current_user && current_user.role == "Client") || (current_user && current_user.role == "OAuth")
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.access_deny_text'
    end
  end

  def check_role_partner
    if (current_user && current_user.role == "Partner") || (current_user && current_user.role == "OAuth")
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.access_deny_text'
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :currency, :amount, :description)
  end


  # Sortable for index inquiry and settlements
  def sort_column
    Inquiry.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
