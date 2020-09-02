class MoviesController < ApplicationController
  # make sure users can only edit and delete movies that they created

  get '/movies' do
    if logged_in?
      @movies = current_user.movies.sort_by {|movie| movie.title}
      erb :'movies/index'
    else
      erb :"/users/login"
    end
  end

  get '/movies/new' do
    if logged_in?
      erb :'/movies/new'
    else
      erb :"/users/login"
    end
  end

  post '/movies' do # account for entering a blank movie
    movie = Movie.create_from_scrape(params[:link]) # account for blank movie info
    movie.user_id = current_user.id
    movie.save
    redirect "/movies/#{movie.id}"
  end

  get '/movies/:id' do
    if logged_in?
      @movie = Movie.find_by(id: params[:id])
      erb :"/movies/show"
    else
      erb :"/users/login"
    end
  end

  post '/:id/comments' do
    if logged_in?
      @movie = Movie.find(params[:id])
      @movie.comments = params[:comments]
      @movie.opinion = params[:opinion]
      @movie.save
      redirect "/movies/#{@movie.id}"
    else
      erb :"/users/login"
    end
  end

  get '/movies/:id/comments' do
    if logged_in?
      @movie = Movie.find_by(id: params[:id])
      erb :"/movies/comment"
    else
      erb :"/users/login"
    end
  end

  get '/movies/:id/comments/edit' do
    if logged_in?
    @movie = Movie.find(params[:id])
      erb :"movies/edit"
    else
      erb :"/users/login"
    end
  end

  patch '/movies/:id' do
    @movie = Movie.find_by(id: params[:id])
    @movie.comments = params[:comments]
    @movie.opinion = params[:opinion]
    @movie.post_time = (Time.now + Time.zone_offset('EST'))
    @movie.save

    redirect "/movies/#{@movie.id}"
  end

  delete '/movies/:id' do
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect '/movies'
  end

end
