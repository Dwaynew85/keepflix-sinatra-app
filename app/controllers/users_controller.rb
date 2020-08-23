class UsersController < ApplicationController

  get '/login' do
    #create email case sensitivety warning
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      # create error message
      redirect '/users/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    @movies = Movie.all.collect { |movie| if movie.comments then movie end }.compact.reverse
    erb :'/users/show'
  end

  get '/signup' do
    #create email case sensitivety warning
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
