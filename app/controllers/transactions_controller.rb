class TransactionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :check_if_user_has_company, only: []
  before_action :check_if_user_access, only: [:index]
  before_action :current_user_check_nil

  def index
    respond_to do |format|
      format.html
      format.mobile
      # format json for android app
      format.json { render json: @transactions }
      format.xml { render xml: @transactions }
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to root_path, notice: 'transaction create' }
      else
        format.html { render action: 'new' }
      end
    end
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
      @transactions = Transaction.paginate(page: params[:page])
    elsif current_user && current_user.role == "Store"
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.your_company_not_verified'
    elsif current_user && current_user.role == "Delivery company"
      @transactions = @user_company.transactions.paginate(page: params[:page])
    else
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

  def transaction_params
    params.require(:transaction).permit(:delivery_company_id, :currency, :amount, :description, :operation, :inquiry_number)
  end
end
