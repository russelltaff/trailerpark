class MoviesController < ApplicationController

  def new
    render :new
  end

  #POST /users/:id/movies
  def create
    # user = User.find(params[:id])
    # If the movie is already persisted (ie in the movies table )
     # just create the connection bet user and movie
    # else
      # persist the movie
    
  end

  def search

    render :search
  end

  def index
    render :index
  end

  def search_results
      @keyword = params[:keyword].gsub(' ', '+')
    url = "http://www.omdbapi.com/?s=#{@keyword}"  
    html = HTTParty.get(url) 
    hash = JSON(html)
    @movie = Movie.new

    @movies.each do |movie|
    @movie_array = movie
  end
  end

end
