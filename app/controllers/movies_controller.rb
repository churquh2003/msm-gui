class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def create_row 
    # Get the user's input out of params
    # Create and save a new row in items table 
    # send user to / page

    m = Movie.new
    m.title = params.fetch("title_movie")
    m.year = params.fetch("year_movie")
    m.duration = params.fetch("duration_movie")
    m.description = params.fetch("description_movie")
    m.image = params.fetch("image_movie")
    m.id = params.fetch("director_id")
    m.save

    redirect_to("/movies", allow_other_host: true)
  end 

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
