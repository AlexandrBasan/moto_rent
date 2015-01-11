class UserMailer < ActionMailer::Base
  default from: ""
  #before_action :store_mail, only: []

  def check_language(user)
    country_code = user.countrycode
    country_code.slice!(0)
    @country_code = country_code
    @country = Country.find_country_by_country_code(@country_code)
    if @country.nil?
      @language = 'en'
      @country_check = 'US'
    else
      @language = @country.languages[0]
      @country_check = @country.alpha2
    end
    user.countrycode = '+' + user.countrycode
    return @language
  end

  def welcome_email(user)
    @user = user
    @cod = @user.countrycode
    @url = ''
      mail(to: @user.email,
           subject: 'Welcome to ',
           template_path: 'user_mailer',
           template_name: 'welcome_email')
  end

  # Mail to Admins
  def new_registration(admins)
    @admins = admins
    mail(to: @admins,
         subject: "New User Signup",
         template_path: 'user_mailer',
         template_name: 'new_registration')
  end

  def password_reset(user)
    @user = user
      mail(to: @user.email,
           subject: 'Password reset',
           template_path: 'user_mailer',
           template_name: 'password_reset')
  end

end
