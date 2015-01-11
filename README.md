# Moto Rent site

This is the Moto Rent system created by Proalab (www.proalab.com) and by [Alexandr Basan]().
In particular, as a first debugging check I suggest getting the test suite to pass on your local machine:

    $ cd /tmp
    $ cd sample_app
    $ cp config/database.yml.example config/database.yml
    $ bundle install
    $ bundle install --without production - without production gems
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    $ bundle exec rspec spec/

Rails servers start

    $ rails s
    $ unicorn_rails

Мы можем откатить один шаг миграции с помощью

  	$ rake db:rollback

Мы будем генерировать модель следующим образом:

  	$ rails generate model Foo bar:string baz:integer
  
Это действие может быть отменено с помощью

  	$ rails destroy model Foo

If the tests don't pass, it means there may be something wrong with your system. If they do pass, then you can debug your code by comparing it with the reference implementation.

GIT

	$ git remote add origin https://github.com/<username>/<app_name>.git
	$ git push -u origin master

	$ git add .
	$ git commit -m "Initialize repository"
	$ git push

	$ git pull - pull repository to server

Create a new repository on the command line

touch README.md

	$ git init
	$ git add README.md
	$ git commit -m "first commit"
	$ git remote add origin https://github.com/Proalab/rubyonrails.git
	$ git push -u origin master
	
Push an existing repository from the command line

	$ git remote add origin https://github.com/Proalab/rubyonrails.git
	$ git push -u origin master


Amazon EC2 = NGIX + Passenger

    $ sudo service nginx start
    $ sudo service nginx stop
    $ sudo service nginx restart

Heroku

    $ rake assets:precompile
    $ RAILS_ENV=production bundle exec rake assets:precompile
    $ git push heroku master
    $ heroku rake db:migrate
    $ heroku restart
    $ heroku open
    $
    $ heroku logs
    $ heroku logs -n 1500

Heroku database
https://devcenter.heroku.com/articles/pgbackups
https://devcenter.heroku.com/articles/heroku-postgres-import-export
or use PGAdmin

    $ heroku pgbackups:capture
    $ heroku pgbackups:url - backup to url
    $ heroku pgbackups:restore DATABASE 'https://s3.amazonaws.com/me/items/3H0q/mydb.dump'
