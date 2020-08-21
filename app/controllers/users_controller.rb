class UsersController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      # create error message
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show' # create users show page displaying greeting by name and listing all movies as links.
  end

  get 'signup' do
    erb :'/users/signup' #
  end

end
