class SessionsController < ApplicationController
  # login (like read)
  get '/login' do
    erb :"sessions/login"
  end

  post '/login' do
  end

  # logout (like delete)
    get '/logout' do
      erb :"sessions/logout"
    end
end