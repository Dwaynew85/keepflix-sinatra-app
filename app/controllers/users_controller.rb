class UsersController < ApplicationController

  get '/login' do
    #create email case sensitivety warning
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome Back!!"
      redirect "/users/#{user.id}"
    else
      flash[:error] = "Invalid credentials. Try again."
      redirect '/login'
    end
  end

  get '/users/:id/edit' do
    @user = User.find_by(params)
    erb :"users/edit"
  end

  patch '/users/:id' do
    @user = User.find_by(id: params[:id])
    @user.update(params[:user])
    @user.save
    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    movies = Movie.all.collect { |movie| if movie.comments then movie end }.compact
    @movies = movies.sort_by { |movie| movie.updated_at }.reverse
    erb :'/users/show'
  end

  get '/signup' do
    #create email case sensitivety warning
    erb :'/users/signup'
  end

  post '/users' do
    @user = User.create(params)
    session[:user_id] = @user.id
    if @user.save
      flash[:message] = "Sign Up Successful!"
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Sign Up Error: #{@user.errors.full_messages.to_sentence}"
      redirect "/signup"
    end
  end

  get '/logout' do
    session.clear
    # add logout message
    redirect '/'
  end

end
