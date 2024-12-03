Rails.application.routes.draw do
  # Actors
  get "/actors", { :controller => "actors", :action => "index" }
  get "/actors/:path_id", { :controller => "actors", :action => "show" }
  post "/insert_actor", { :controller => "actors", :action => "create_row" }
  post "/update_actor/:path_id", { :controller => "actors", :action => "update_row" }
  get "/delete_actor/:path_id", { :controller => "actors", :action => "destroy" }

  # Directors
  get "/directors", { :controller => "directors", :action => "index" }
  get "/directors/:path_id", { :controller => "directors", :action => "show" }
  post "/insert_director", { :controller => "directors", :action => "create_row" }
  post "/update_director/:path_id", { :controller => "directors", :action => "update_row" }
  get "/delete_director/:path_id", { :controller => "directors", :action => "destroy" }
  get "/directors/youngest", { :controller => "directors", :action => "max_dob" }
  get "/directors/eldest", { :controller => "directors", :action => "min_dob" }

  # Movies
    get "/movies", { :controller => "movies", :action => "index" }
    get "/movies/:path_id", { :controller => "movies", :action => "show" }
    post "/update_movie/:path_id", { :controller => "movies", :action => "update_row" }
    post("/insert_movie", { :controller => "movies", :action => "create_row" })
    get("/delete_movie/:an_id",{ :controller => "movies", :action => "destroy" })
    post("/edit_movie_record/:the_id", { :controller => "movies", :action => "edit" }) 
  end
  
