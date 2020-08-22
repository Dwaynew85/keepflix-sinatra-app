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

  get '/movies/comments/:id' do
    if logged_in?
      @movie = Movie.find_by(id: params[:id])
      erb :"/movies/comment"
    else
      erb :"/users/login"
    end
  end

  post '/comments' do  # need info to update to movie object
    if logged_in?
      @movie = Movie.find(params.keys.last)
      @movie.comments = params[:comments]
      @movie.opinion = params[:opinion]
      @movie.save
      redirect "/movies/#{@movie.id}"
    else
      erb :"/users/login"
    end
  end

  get '/movies/comments/:id/edit' do
    "build out edit views with similar form to comment.rb"
  end

end
