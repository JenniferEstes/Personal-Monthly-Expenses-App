class SessionsController < ApplicationController
  # login (like read)
  get '/login' do
    redirect_if_logged_in
    erb :'sessions/login'
  end

  post '/login' do
    redirect_if_logged_in
    #returns nil or user object
    user = User.find_by(username: params[:username])
    if user && !!user.authenticate(params[:password])
      session["user_id"] = user.id
      redirect "/expenses"
    else
      redirect "/login"
    end
  end

  # logout (like delete)
  delete '/logout' do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect_if_not_logged_in
    end
  end
end