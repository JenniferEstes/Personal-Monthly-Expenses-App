class SessionsController < ApplicationController

  # Signup (like new)
  get '/signup' do
    erb :"sessions/signup"
  end

  post '/signup' do
    session = Session.new(params)
    if session.username.empty? || session.password.empty? || Session.find_by(username: params[:username])
      redirect "/sessions/signup"
    else
      #log user in
      session.save
      session[:user_id] = user.id
      redirect '/espenses'
    end
  end

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