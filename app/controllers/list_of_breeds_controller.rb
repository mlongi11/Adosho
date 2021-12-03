class ListOfBreedsController < ApplicationController
  def index
    matching_list_of_breeds = ListOfBreed.all

    @list_of_list_of_breeds = matching_list_of_breeds.order({ :created_at => :desc })

    render({ :template => "list_of_breeds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_list_of_breeds = ListOfBreed.where({ :id => the_id })

    @the_list_of_breed = matching_list_of_breeds.at(0)

    render({ :template => "list_of_breeds/show.html.erb" })
  end

  def create
    the_list_of_breed = ListOfBreed.new
    the_list_of_breed.species = params.fetch("query_species")

    if the_list_of_breed.valid?
      the_list_of_breed.save
      redirect_to("/list_of_breeds", { :notice => "List of breed created successfully." })
    else
      redirect_to("/list_of_breeds", { :notice => "List of breed failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_list_of_breed = ListOfBreed.where({ :id => the_id }).at(0)

    the_list_of_breed.species = params.fetch("query_species")

    if the_list_of_breed.valid?
      the_list_of_breed.save
      redirect_to("/list_of_breeds/#{the_list_of_breed.id}", { :notice => "List of breed updated successfully."} )
    else
      redirect_to("/list_of_breeds/#{the_list_of_breed.id}", { :alert => "List of breed failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_list_of_breed = ListOfBreed.where({ :id => the_id }).at(0)

    the_list_of_breed.destroy

    redirect_to("/list_of_breeds", { :notice => "List of breed deleted successfully."} )
  end
end
