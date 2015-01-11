class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :check_user, only: [:create, :new]
  before_action :check_admin, only: [:collaboration]

  # Check user role
  before_action :check_role_client, only: [:index, :destroy]
  before_action :check_role_partner, only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
  end

  def show
    @user = User.find(params[:id])
    @company_name_for_show = nil
    if @user.admin?
      @company_name = "Administrator"
    else
      @company_name = ""
    end
  end

  def new
    if params[:invitation_token].nil? || params[:invitation_token].blank?
      @user = User.new
    else
      @user = User.new(:invitation_token => params[:invitation_token])
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.update_attribute :subscription, true
        # Mail to user
        UserMailer.welcome_email(@user).deliver

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = I18n.t 'flash.profile_updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
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

  # Check user role
  def check_user
    if current_user
      redirect_to root_path
    end
  end

  def check_admin
    if current_user && current_user.admin?
      redirect_to root_path
      flash[:danger] = I18n.t 'flash.access_deny_text'
    end
  end

  def collaboration
  end

  def unsubscribe
  end
  #unsubscribe
  def unsubscribe_action
    user = User.find_by_email(params[:email])
    if user.nil?
      redirect_to root_url
      flash[:danger] = I18n.t 'unsubscribe_block.unsubscribe_error'
    else
      user.update_attribute :subscription, false
      redirect_to root_url
      flash[:success] = I18n.t 'unsubscribe_block.unsubscribe_success'
    end
  end

  private
  # Save information in database - PRIVAT
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :countrycode, :phone, :role, :terms_of_service, :invitation_token, :subscription)
  end

  # Before filters

  def correct_user
    @user = User.find(params[:id])
    if current_user.admin?
    else
      redirect_to(root_url) unless current_user?(@user)
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  # Sortable for index inquiry and settlements
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
