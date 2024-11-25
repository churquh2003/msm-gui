class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def create_row
    i = Director.new
    i.name = params.fetch("name_director")
    i.dob = params.fetch("dob_director")
    i.bio = params.fetch("bio_director")
    i.image = params.fetch("image_director")
    i.save

    redirect_to("/directors")
  end

  def update_row
    the_id = params.fetch("path_id")
    i = Director.where({ :id => the_id }).at(0)

    i.name = params.fetch("name_director")
    i.dob = params.fetch("dob_director")
    i.bio = params.fetch("bio_director")
    i.image = params.fetch("image_director")
    i.save

    redirect_to("/directors")
  end

  def show
    the_id = params.fetch("path_id")
    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_directors = Director.where({ :id => the_id })
    the_director = matching_directors.at(0)
    the_director.destroy

    redirect_to("/directors")
  end
end
