class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  # i18n multilanguage.
  before_action :set_locale

  before_action :user_time_zone
  before_action :check_currency
  before_action :general_settings

  # user last seen_at
  before_filter :set_last_seen_at, if: proc { |p| signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }

  # Current user enable in model
  before_filter :set_current_user
  def set_current_user
    User.current = current_user
  end
  # Current user enable in model

  # Resque form for invalid authentificitytoken
  rescue_from ActionController::InvalidAuthenticityToken, :with => :bad_token
  def bad_token
    flash[:warning] = (t 'flash.session_expired')
    redirect_to signin_path
  end
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  def record_not_found
    redirect_to root_path
  end

  rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique
  def record_not_unique
    flash[:warning] = (t 'flash.record_already_exist')
    redirect_to root_path
  end

  # API POST REGUEST ALLOW CROSS DOMAIN
  before_filter :cor
  def cor
    headers["Access-Control-Allow-Origin"]  = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end

  # Language
  def set_locale
    #I18n.locale = params[:locale] || I18n.default_locale
    if params[:locale]
      # Language switcher
      I18n.locale = params[:locale] || I18n.default_locale
    else
      I18n.locale = (http_accept_language.compatible_language_from(I18n.available_locales)) || (I18n.default_locale)
    end
  end
  # Language

  #Client site time zone from browser
  def user_time_zone
    @user_time_zone = cookies[:user_timezone]
  end

  # Check user countrycode
  def check_currency
    if signed_in?
      country_code = current_user.countrycode
      country_code.slice!(0)
      @country_code = country_code
      @country = Country.find_country_by_country_code(@country_code)
      if @country.nil?
        @currency = 'USD'
        @country_check = 'US'
      else
        @currency = @country.currency['code']
        @country_check = @country.alpha2
      end
      current_user.countrycode = '+' + current_user.countrycode
    end
  end

  #General Settings
  def general_settings

  end
  #General Settings


  # remember user language choise in navigation process
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {locale: I18n.locale}
  end

  ###########################BOOTSTRAP ELEMENTS FOR ALL###########################
  require 'action_view/helpers/tags/base'
  # Most input types need the form-control class on them.  This is the easiest way to get that into every form input
  module BootstrapTag
    FORM_CONTROL_CLASS = 'form-control'

    def tag(name, options, *)
      options = add_bootstrap_class_to_options options, true if name.to_s == 'input'
      super
    end

    private

    def content_tag_string(name, content, options, *)
      options = add_bootstrap_class_to_options options if name.to_s.in? %w(select textarea)
      super
    end

    def add_bootstrap_class_to_options(options, check_type = false)
      options = {} if options.nil?
      options.stringify_keys!
      if !check_type || options['type'].to_s.in?(%w(text password number email))
        options['class'] = [] unless options.has_key? 'class'
        options['class'] << FORM_CONTROL_CLASS if options['class'].is_a?(Array) && !options['class'].include?(FORM_CONTROL_CLASS)
        options['class'] << " #{FORM_CONTROL_CLASS}" if options['class'].is_a?(String) && options['class'] !~ /\b#{FORM_CONTROL_CLASS}\b/
      end
      options
    end
  end

  ActionView::Helpers::Tags::Base.send :include, BootstrapTag
  ActionView::Base.send :include, BootstrapTag
  ###########################BOOTSTRAP ELEMENTS FOR ALL###########################

  # Mobile device if
  private
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
    request.format = :mobile
  end

  # user last seen_at
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
    session[:last_seen_at] = Time.now
  end

  helper_method :mobile_device?

end
