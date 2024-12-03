class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def create_row
    m = Movie.new
    m.title = params.fetch("title_movie") # Fetch title from the form
    m.director_id = params.fetch("director_id") # Fetch director ID from the form
    m.save # Save the new movie record
  
    redirect_to("/movies") # Redirect to movies index
  end  
  

  def show
    the_id = params.fetch("path_id")
    @the_movie = Movie.where({ :id => the_id }).at(0)
    @the_director = Director.where({ :id => @the_movie.director_id }).at(0)
  
    render({ :template => "movie_templates/show" })
  end
  

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Movie.where({ :id => the_id })
    the_movie = matching_records.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end

  def edit
    m_id = params.fetch("the_id")
    matching_records = Movie.where({ :id => m_id})
    the_movie = matching_records.at(0)
    the_movie.title = params.fetch("the_title")
    the_movie.year = params.fetch("the_year")
    the_movie.duration = params.fetch("the_duration")
    the_movie.description = params.fetch("the_description")
    the_movie.image = params.fetch("the_image")
    the_movie.director_id = params.fetch("the_director_id")
     
     the_movie.save
     redirect_to("/movies/#{the_movie.id}")
  end
end
