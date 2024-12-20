class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

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
  
  def max_dob
    @youngest = Director.
      where.not(dob: nil).
      order(dob: :desc).
      first

    if @youngest.nil?
      @youngest = Director.new(name: "No youngest director found", dob: nil)
    end

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    @eldest = Director.
      where.not(dob: nil).
      order(dob: :asc).
      first

    if @eldest.nil?
      @eldest = Director.new(name: "No eldest director found", dob: nil)
    end

    render({ :template => "director_templates/eldest" })
  end
end
