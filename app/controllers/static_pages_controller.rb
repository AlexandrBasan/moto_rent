class StaticPagesController < ApplicationController

  def home
    @blogs = Blog.paginate(page: params[:page], :per_page => 5)

    # Booking form
    @booking = Booking.new
    @vehicletypes = Vehicletype.all
    @airports = Airport.all
    @order = Order.new
  end

  def help
  end

  def countries
  end

  def about
  end

  def contact
  end

  def access_deny
  end

  def terms
  end

  def partners
  end

  def transfers

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

end
