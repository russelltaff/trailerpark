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

  def search_by_keyword
    @keyword = params[:keyword].gsub(' ', '+')
    url = "http://www.omdbapi.com/?s=#{@keyword}"  
    html = HTTParty.get(url) 
    hash = JSON(html)
    @movies = hash["Search"]
    # @movie = Movie.new

  end

  def search_by_full_title
    @title = params[:title].gsub(' ', '+')
    url = "http://www.omdbapi.com/?t=#{@title}"  
    html = HTTParty.get(url) 
    @movie = JSON(html)
    # @movie = Movie.new
    raw_xml = HTTParty.get("http://api.traileraddict.com/?imdb=#{@movie['imdbID'].gsub('tt', '')}&count=4&width=680")
    @link = raw_xml["trailers"]["trailer"].map { |t| t["link"] }.first
    end

  def redirect_from_keyword
    @title = params[:title].gsub(' ', '+')
    url = "http://www.omdbapi.com/?t=#{@title}"  
    html = HTTParty.get(url) 
    @movie = JSON(html)

    raw_xml = HTTParty.get("http://api.traileraddict.com/?imdb=#{@movie['imdbID'].gsub('tt', '')}&count=4&width=680")
    @link = raw_xml["trailers"]["trailer"].map { |t| t["link"] }.first
  end

end





