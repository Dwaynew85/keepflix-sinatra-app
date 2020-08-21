class UsersController < ApplicationController

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      # create error message
      redirect '/uses/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show' # create users show page displaying greeting by name and listing all movies as links.
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/users' do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end

  get '/logout' do
    session.clear
    # add logout message
    redirect '/'
  end

end
