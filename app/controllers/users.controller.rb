class UsersController < ApplicationController
  #signup or maybe deleting account if I have time
  #   # Signup (like new)
    get '/signup' do
      erb :"users/signup"
    end
  #
    post '/signup' do
      user = User.new(params[:user])
        #log user in
      if user.username.blank? || user.password.blank? || user.password_confirmation.blank?
        redirect "/signup"
      else
        user.save
        session[:user_id] = user.id
        redirect "/expenses"
      end
    end

  get '/signout' do
    erb :"users/signout"
  end
end