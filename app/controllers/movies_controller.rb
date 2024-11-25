class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all.order({ :created_at => :desc })
    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_movie = Movie.where({ :id => the_id }).at(0)
    render({ :template => "movie_templates/show" })
  end

  def create_row
    movie = Movie.new
    movie.title = params.fetch("title_movie")
    movie.year = params.fetch("year_movie")
    movie.duration = params.fetch("duration_movie")
    movie.description = params.fetch("description_movie")
    movie.image = params.fetch("image_movie")
    movie.director_id = params.fetch("director_id")
    movie.save
    redirect_to("/movies")
  end

  def update_row
    the_id = params.fetch("path_id")
    movie = Movie.where({ :id => the_id }).at(
