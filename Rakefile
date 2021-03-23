ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'

#only need this when doing rake task
require 'sinatra/activerecord/rake'

desc "Start console"
task :console do
  Pry.start
end