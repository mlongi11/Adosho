class PetBreedsController < ApplicationController
  def index
    matching_pet_breeds = PetBreed.all

    @list_of_pet_breeds = matching_pet_breeds.order({ :created_at => :desc })

    render({ :template => "pet_breeds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_pet_breeds = PetBreed.where({ :id => the_id })

    @the_pet_breed = matching_pet_breeds.at(0)

    render({ :template => "pet_breeds/show.html.erb" })
  end

  def create
    the_pet_breed = PetBreed.new
    the_pet_breed.breed_id = params.fetch("query_breed_id")
    the_pet_breed.pet_id = params.fetch("query_pet_id")

    if the_pet_breed.valid?
      the_pet_breed.save
      redirect_to("/pet_breeds", { :notice => "Pet breed created successfully." })
    else
      redirect_to("/pet_breeds", { :notice => "Pet breed failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_pet_breed = PetBreed.where({ :id => the_id }).at(0)

    the_pet_breed.breed_id = params.fetch("query_breed_id")
    the_pet_breed.pet_id = params.fetch("query_pet_id")

    if the_pet_breed.valid?
      the_pet_breed.save
      redirect_to("/pet_breeds/#{the_pet_breed.id}", { :notice => "Pet breed updated successfully."} )
    else
      redirect_to("/pet_breeds/#{the_pet_breed.id}", { :alert => "Pet breed failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_pet_breed = PetBreed.where({ :id => the_id }).at(0)

    the_pet_breed.destroy

    redirect_to("/pet_breeds", { :notice => "Pet breed deleted successfully."} )
  end
end
