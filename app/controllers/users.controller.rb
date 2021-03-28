class UsersController < ApplicationController
  #signup or maybe deleting account if I have time
  #   # Signup (like new)
    get '/signup' do
      erb :"users/signup"
    end
  #
    post '/signup' do
      session = Session.new(params)
      if session.username.empty? || session.password.empty? || Session.find_by(username: params[:username])
        redirect "/users/signup"
      else
        #log user in
        session.save
        session[:user_id] = user.id
        redirect '/expenses'
      end
    end

  get '/signout' do
    erb :"sessions/signout"
  end
  end