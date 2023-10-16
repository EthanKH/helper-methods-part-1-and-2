Rails.application.routes.draw do
  get "/" => "movies#index"
  # get("/", { :controller => "movies", :action => "index" })

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies
  # post("/movies", { :controller => "movies", :action => "create" })
  get "/movies/new" => "movies#new", as: :new_movie
  # get("/movies/new", { :controller => "movies", :action => "new" })
          
  # READ
  get "/movies" => "movies#index"
  # get("/movies", { :controller => "movies", :action => "index" })
  get "/movies/:id" => "movies#show", as: :movie
  # get("/movies/:id", { :controller => "movies", :action => "show" })
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  # patch("/movies/:id", { :controller => "movies", :action => "update" })
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie
  # get("/movies/:id/edit", { :controller => "movies", :action => "edit" })
  
  # DELETE
  delete "/movies/:id" => "movies#destroy"
  # delete("/movies/:id", { :controller => "movies", :action => "destroy" })

  #------------------------------
end
