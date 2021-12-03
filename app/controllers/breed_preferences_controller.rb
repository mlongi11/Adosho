class BreedPreferencesController < ApplicationController
  def index
    matching_breed_preferences = BreedPreference.all

    @list_of_breed_preferences = matching_breed_preferences.order({ :created_at => :desc })

    render({ :template => "breed_preferences/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_breed_preferences = BreedPreference.where({ :id => the_id })

    @the_breed_preference = matching_breed_preferences.at(0)

    render({ :template => "breed_preferences/show.html.erb" })
  end

  def create
    the_breed_preference = BreedPreference.new
    the_breed_preference.user_id = params.fetch("query_user_id")
    the_breed_preference.breed_id = params.fetch("query_breed_id")

    if the_breed_preference.valid?
      the_breed_preference.save
      redirect_to("/breed_preferences", { :notice => "Breed preference created successfully." })
    else
      redirect_to("/breed_preferences", { :notice => "Breed preference failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_breed_preference = BreedPreference.where({ :id => the_id }).at(0)

    the_breed_preference.user_id = params.fetch("query_user_id")
    the_breed_preference.breed_id = params.fetch("query_breed_id")

    if the_breed_preference.valid?
      the_breed_preference.save
      redirect_to("/breed_preferences/#{the_breed_preference.id}", { :notice => "Breed preference updated successfully."} )
    else
      redirect_to("/breed_preferences/#{the_breed_preference.id}", { :alert => "Breed preference failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_breed_preference = BreedPreference.where({ :id => the_id }).at(0)

    the_breed_preference.destroy

    redirect_to("/breed_preferences", { :notice => "Breed preference deleted successfully."} )
  end
end
