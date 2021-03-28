class SessionsController < ApplicationController
  # login (like read)
  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    #returns nill or user object
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:username][:password])
      session[:user_id] = user.id
      redirect "/expenses"
    else
      redirect "/login"
    end
  end

  # logout (like delete)
  delete '/logout' do
    session.clear
    redirect "/login"
  end
end