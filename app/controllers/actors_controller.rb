class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all.order({ :created_at => :desc })
    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_actor = Actor.where({ :id => the_id }).at(0)

    # Fetch characters played by the actor
    @characters = Character.where({ :actor_id => @the_actor.id })

    # Fetch movies and directors for each character
    @movies_with_directors = @characters.map do |character|
      movie = Movie.where({ :id => character.movie_id }).at(0)
      director = Director.where({ :id => movie.director_id }).at(0) if movie
      { movie: movie, director: director }
    end

    render({ :template => "actor_templates/show" })
  end

  def create_row
    actor = Actor.new
    actor.name = params.fetch("name_actor")
    actor.dob = params.fetch("dob_actor")
    actor.bio = params.fetch("bio_actor")
    actor.image = params.fetch("image_actor")
    actor.save
    redirect_to("/actors")
  end

  def update_row
    the_id = params.fetch("path_id")
    actor = Actor.where({ :id => the_id }).at(0)
    actor.name = params.fetch("name_actor")
    actor.dob = params.fetch("dob_actor")
    actor.bio = params.fetch("bio_actor")
    actor.image = params.fetch("image_actor")
    actor.save
    redirect_to("/actors/#{actor.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    actor = Actor.where({ :id => the_id }).at(0)
    actor.destroy
    redirect_to("/actors")
  end
end
