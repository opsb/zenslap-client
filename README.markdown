zenslap
=======

Provides an easy way to configure your heroku test environment for your app

Install
-------

gem install zenslap

### Usage ###

The zenslap command delegates to the heroku command. It passes in the name of the heroku app that is used by zenslap for your testing environment. The first time you run the command you'll be asked for the of the zenslap app. You can find the name of this app on your dashboard.

#### Examples ####


##### First run #####

$ zenslap config

Enter the name of the zenslap app
my zenslap app

DATABASE_URL      => mysql://...
RACK_ENV					=> test

##### All other runs #####
$ zenslap config

DATABASE_URL      => mysql://...
RACK_ENV					=> test
  
