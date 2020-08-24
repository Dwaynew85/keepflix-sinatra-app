class MoviesController < ApplicationController

  get '/movies' do
    if logged_in?
      @movies = current_user.movies.sort_by {|movie| movie.title}
      erb :'movies/index'
    else
      erb :"/users/login"
    end
  end

  get '/movies/new' do
    erb :'/movies/new'
  end

  post '/movies/new' do
    movie = Movie.create_from_scrape(params[:link])
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

  post '/comments/:id' do
    if logged_in?
      @movie = Movie.find(params[:id])
      @movie.comments = params[:comments]
      @movie.opinion = params[:opinion]
      #@movie.post_time = (Time.now + Time.zone_offset('EST')) # add .rfc2822 on user page
      @movie.save
      redirect "/movies/#{@movie.id}"
    else
      erb :"/users/login"
    end
  end

  get '/movies/comments/:id/edit' do
    @movie = Movie.find(params[:id])
    erb :"movies/edit"
  end

  get '/movies/comments/:id' do
    if logged_in?
      @movie = Movie.find_by(id: params[:id])
      erb :"/movies/comment"
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
