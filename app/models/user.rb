class User < ActiveRecord::Base
  has_one :supplier
  has_many :orders
  has_many :transactions
  has_many :bookings

  #default_scope -> { order('created_at DESC') }
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  # E-mail Validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  # Password Validation
  has_secure_password
  validates :password, length: {minimum: 6}
  # Phone Validation
  #VALID_PHONE_REGEX = /([0-9]{9,10})/
  VALID_PHONE_REGEX = /([0-9]{9,10})\z/
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, length: { maximum: 10 }
  validates :role, :inclusion => { :in => ['Client', 'Partner', 'OAuth'] }

  # Current user enable in model
  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
  # Current user enable in model

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # Password Reset
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  # Password Reset

  #OAuth
  require 'securerandom'
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      @pass = SecureRandom.hex(12)
      user.password = @pass
      user.password_confirmation = @pass
      if (user.role == "Client") || (user.admin == true) || (user.role == "Partner")
      else
        user.role = "OAuth"
        user.phone = "3334444333"
        user.countrycode = "+1"
        user.subscription = true
      end
      user.oauth_token = auth.credentials.token
      user.oauth_link_image = auth.info.image
      if auth.provider == "twitter"
        user.email = auth.info.nickname + "@twitter.com"
        user.oauth_link = auth.info.urls.Twitter
      elsif auth.provider == "facebook"
        user.oauth_link = auth.info.urls.Facebook
        if auth.info.email.nil? || auth.info.email.blank?
          user.email = auth.info.nickname + "@facebook.com"
        else
          user.email = auth.info.email
        end
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      elsif auth.provider == "google_oauth2"
        user.oauth_link = auth.extra.raw_info.profile
        user.email = auth.info.email
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      else
        user.email = auth.info.email
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
      # check validation
      @array_error_oauth = Array.new([])
      if user.valid? && User.find_by(email: auth.info.email) == nil
        user.save!
      else
        #@user_oauth_errors = user.errors
        @array_error_oauth.push(user.errors)
      end
      #  user.save!
    end
  end

  def self.check_oauth_errors
    if @array_error_oauth.blank?
      true
    else
      false
      @array_error_oauth
    end
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
