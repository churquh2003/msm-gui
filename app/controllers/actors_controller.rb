class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def create_row
    q = Actor.new
    q.name = params.fetch("name_actor")
    q.dob = params.fetch("dob_actor")
    q.bio = params.fetch("bio_actor")
    q.image = params.fetch("image_actor")
    q.save

    redirect_to("/actors")
  end

  def update_row
    the_id = params.fetch("path_id")
    q = Actor.where({ :id => the_id }).at(0)

    q.name = params.fetch("name_actor")
    q.dob = params.fetch("dob_actor")
    q.bio = params.fetch("bio_actor")
    q.image = params.fetch("image_actor")
    q.save

    redirect_to("/actors")
  end

  def show
    the_id = params.fetch("path_id")
    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)

    render({ :template => "actor_templates/show" })
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_actors = Actor.where({ :id => the_id })
    the_actor = matching_actors.at(0)
    the_actor.destroy

    redirect_to("/actors")
  end
end
