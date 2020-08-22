class MoviesController < ApplicationController

  get '/movies' do
    if logged_in?
      @movies = current_user.movies
      erb :'movies/index'
    else
      erb :"/users/login"
    end
  end

  get '/movies/:id' do
    if logged_in?
      @movie = Movie.find_by(id: params[:id])
      erb :"/movies/show"
    else
      erb :"/users/login"
    end
  end

  get '/movies/comment/:id' do
    if logged_in?
      @movie = Movie.find_by(id: params[:id])
      erb :"/movies/comment"
    else
      erb :"/users/login"
    end
  end

  post '/comment/:id'  # need info to update to movie object
    @movie = Movie.find(id)
    binding.pry

  end

end
