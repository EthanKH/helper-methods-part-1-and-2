class MoviesController < ApplicationController
 

  def index
    # matching_movies = Movie.all

    # @movies = matching_movies.order({ :created_at => :desc })
    @movies = Movie.order(created_at: :desc)


    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html do
      end
    end
  end

  def show

    the_id = params.fetch(:id) # First get iD

    # matching_movies = Movie.where({ :id => the_id }) 
    matching_movies = Movie.where(id: the_id) # Second get matching rows (ActiveRecord:Relation)

    @movie = matching_movies.first # Third get the one instance of ActiveRecord/one row

    # @the_movie = Movie.where(id: params.fetch(:id)).first # this single line tends to be used
    # @the_movie = Movie.find_by(:id params.fetch(:id)) # this returns a nil if there's no id, or 500 error page
    # @the_movie = Movie.find(params.fetch(:id)) # throws 404 error exception if ID doesn't exist
    # @movie = Movie.find(params.fetch(:id))

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch(:title)
    @movie.description = params.fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully."
    else
      redirect_to movies_url, notice: "error"
    end
  end

  def edit
    the_id = params.fetch(:id)

    # matching_movies = Movie.where({:id => the_id })
    matching_movies = Movie.where(id: the_id)

    @movie = matching_movies.first

  end

  def update
    the_id = params.fetch(:id)
    # the_movie = Movie.where({ :id => the_id }).first
    movie = Movie.where(id: the_id).first

    movie.title = params.fetch("query_title")
    movie.description = params.fetch("query_description")

    if movie.valid?
      movie.save
      redirect_to "/movies/#{movie.id}", notice: "Movie updated successfully."
    else
      redirect_to "/movies/#{movie.id}", alert: "Movie failed to update successfully."
    end
  end

  def destroy
    the_id = params.fetch(:id)
    # the_movie = Movie.where({ :id => the_id }).first
    movie = Movie.where(id: the_id).first
    

    movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end
