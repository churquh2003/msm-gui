class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all.order({ :created_at => :desc })
    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_director = Director.where({ :id => the_id }).at(0)

    # Fetch movies directed by the director
    @movies = Movie.where({ :director_id => @the_director.id })

    render({ :template => "director_templates/show" })
  end

  def create_row
    director = Director.new
    director.name = params.fetch("name_director")
    director.dob = params.fetch("dob_director")
    director.bio = params.fetch("bio_director")
    director.image = params.fetch("image_director")
    director.save
    redirect_to("/directors")
  end

  def update_row
    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)
    director.name = params.fetch("name_director")
    director.dob = params.fetch("dob_director")
    director.bio = params.fetch("bio_director")
    director.image = params.fetch("image_director")
    director.save
    redirect_to("/directors/#{director.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)
    director.destroy
    redirect_to("/directors")
  end
end
