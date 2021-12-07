class PetsController < ApplicationController
  def index
    @q = Pet.ransack(params[:q])

    @list_of_pets = @q.result

    render({ :template => "pets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_pets = Pet.where({ :id => the_id })

    @the_pet = matching_pets.at(0)

    render({ :template => "pets/show.html.erb" })
  end

  def create
    the_pet = Pet.new
    the_pet.name = params.fetch("query_name")
    the_pet.estimated_birthday = params.fetch("query_estimated_birthday")
    the_pet.status = params.fetch("query_status")
    the_pet.adopter_id = params.fetch("query_adopter_id")
    the_pet.gender = params.fetch("query_gender")
    the_pet.weight = params.fetch("query_weight")
    the_pet.children_competability_ranking = params.fetch("query_children_competability_ranking")
    the_pet.dog_competability_ranking = params.fetch("query_dog_competability_ranking")
    the_pet.cat_competability_ranking = params.fetch("query_cat_competability_ranking")
    the_pet.home_alone_competability_ranking = params.fetch("query_home_alone_competability_ranking")
    the_pet.activity_competability_ranking = params.fetch("query_activity_competability_ranking")
    the_pet.notes = params.fetch("query_notes")
    the_pet.foster_id = params.fetch("query_foster_id")
    the_pet.species = params.fetch("query_species")

    if the_pet.valid?
      the_pet.save
      redirect_to("/pets", { :notice => "Pet created successfully." })
    else
      redirect_to("/pets", { :notice => "Pet failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_pet = Pet.where({ :id => the_id }).at(0)

    the_pet.name = params.fetch("query_name")
    the_pet.estimated_birthday = params.fetch("query_estimated_birthday")
    the_pet.status = params.fetch("query_status")
    the_pet.adopter_id = params.fetch("query_adopter_id")
    the_pet.gender = params.fetch("query_gender")
    the_pet.weight = params.fetch("query_weight")
    the_pet.children_competability_ranking = params.fetch("query_children_competability_ranking")
    the_pet.dog_competability_ranking = params.fetch("query_dog_competability_ranking")
    the_pet.cat_competability_ranking = params.fetch("query_cat_competability_ranking")
    the_pet.home_alone_competability_ranking = params.fetch("query_home_alone_competability_ranking")
    the_pet.activity_competability_ranking = params.fetch("query_activity_competability_ranking")
    the_pet.notes = params.fetch("query_notes")
    the_pet.foster_id = params.fetch("query_foster_id")
    the_pet.species = params.fetch("query_species")

    if the_pet.valid?
      the_pet.save
      redirect_to("/pets/#{the_pet.id}", { :notice => "Pet updated successfully."} )
    else
      redirect_to("/pets/#{the_pet.id}", { :alert => "Pet failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_pet = Pet.where({ :id => the_id }).at(0)

    the_pet.destroy

    redirect_to("/pets", { :notice => "Pet deleted successfully."} )
  end
end
