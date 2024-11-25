class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def create_row 
    # Get the user's input out of params
    # Create and save a new row in items table 
    # send user to / page

    q = Actor.new
    q.name = params.fetch("name_actor")
    q.dob = params.fetch("dob_actor")
    q.bio = params.fetch("bio_actor")
    q.image = params.fetch("image_actor")
    q.save

    redirect_to("/actors", allow_other_host: true)
  end 

  def update_row 
    # Get the user's input out of params
    # Create and save a new row in items table 
    # send user to / page

    q = Actor.new
    q.name = params.fetch("name_actor")
    q.dob = params.fetch("dob_actor")
    q.bio = params.fetch("bio_actor")
    q.image = params.fetch("image_actor")
    q.save

    redirect_to("/actors", allow_other_host: true)
  end 

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

end
