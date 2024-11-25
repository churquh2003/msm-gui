class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def create_row
    m = Movie.new
    m.title = params.fetch("title_movie")
    m.year = params.fetch("year_movie")
    m.duration = params.fetch("duration_movie")
    m.description = params.fetch("description_movie")
    m.image = params.fetch("image_movie")
    m.director_id = params.fetch("director_id") # Fixed field
    m.save

    redirect_to("/movies")
  end

  def show
    the_id = params.fetch("path_id")
    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def update_row
    the_id = params.fetch("path_id")
    m = Movie.where({ :id => the_id }).at(0)

    m.title = params.fetch("title_movie")
    m.year = params.fetch("year_movie")
    m.duration = params.fetch("duration_movie")
    m.description = params.fetch("description_movie")
    m.image = params.fetch("image_movie")
    m.director_id = params.fetch("director_id")
    m.save

    redirect_to("/movies/#{m.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)
    the_movie.destroy

    redirect_to("/movies")
  end
end
