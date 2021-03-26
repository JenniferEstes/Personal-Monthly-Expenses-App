require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auth_demo_lv"
  end

  # get "/" do
  #   erb :'expenses/new'
  # end

  # get '/expenses/new' do
  #   "Hello World"
  # end

#   get '/expenses/index' do
#     "Hello World"
#   end
#
# get '/expenses/edit' do
#     "Hello World"
#   end
#
#   get '/expenses/show' do
#     "Hello World"
#   end
end
