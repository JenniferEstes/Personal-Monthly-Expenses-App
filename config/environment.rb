#take environment var Sinatra, if we have it, and if it hasn't been declared, it's falsey and it's value will set to the str developement
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

#connection to db
ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
                                        })

require './app/controllers/application_controller'
require_all 'app'
