source 'https://rubygems.org'
ruby '2.1.5'
#ruby-gemset=moto_rent

gem 'rails', '4.1.5'
gem 'bootstrap-sass'
gem 'bcrypt-ruby', '3.1.2'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate'

# i18n multilanguage.
gem 'rails-i18n', '~> 4.0.0'
gem 'http_accept_language'
# user avatar
gem 'paperclip', '~> 4.1'
# amazon s3 for paperclip
#gem 'aws-sdk'
# https://console.aws.amazon.com/s3/home?region=us-west-2
# https://devcenter.heroku.com/articles/paperclip-s3
# Exeption notification if error
gem 'exception_notification'
# Currency convertion
#gem 'money'
#gem 'google_currency'
# Countries gem
gem 'countries', :git => 'https://github.com/hexorx/countries.git'
#gem 'country_select'

# OAuth
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'

#Payments
gem 'paypal-sdk-rest'

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
  # The following optional lines are part of the advanced setup.
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  #ruby debug ide
  #gem 'ruby-debug-ide'
  # security tools check
  gem 'brakeman'
  # perfomance tools check
  gem 'rack-mini-profiler'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  # Uncomment this line on OS X.
  gem 'growl', '1.0.3'

  # Uncomment these lines on Linux.
  # gem 'libnotify', '0.8.0'

  # Uncomment these lines on Windows.
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.2'
  # gem 'wdm', '0.1.0'
end

gem 'sass-rails'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

# Import xls
gem 'roo'
gem 'iconv'

#gem 'wicked'
#gem 'nested_form'

# Amazon EC2

#Heroku
#gem 'less-rails'
#gem 'therubyracer'

#Error css files
gem 'sprockets', '2.11.0'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  # newrelic.com server monitoring
  gem 'newrelic_rpm'
  gem 'unicorn'
end
