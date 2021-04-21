class SessionsController < ApplicationController
  get '/login' do
    if !logged_in?
      erb :'sessions/login'
    else
      redirect to '/items'
    end
  end

  post '/login' do
    @user= User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/items'
    else
      flash[:message] = ["Invalid username and/or password"]
      erb :'sessions/login'
    end
  end
end