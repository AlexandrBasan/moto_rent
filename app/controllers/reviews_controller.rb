class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # Check user role
  before_action :check_role_client, only: [:new, :show, :edit, :create, :update, :destroy]
  before_action :check_role_partner, only: [:new, :show, :edit, :create, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.paginate(page: params[:page])
  end

  def index_site
    @reviews = Review.where(show: true).paginate(page: params[:page])
  end


  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :language, :review, :show, :link, :title, :image_link)
    end
end
