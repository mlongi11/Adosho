class MatchesController < ApplicationController
  def index
    matching_matches = Match.where({:user_id => @current_user.id})

    @list_of_matches = matching_matches.order({ :match_strength => :desc })

    render({ :template => "matches/index.html.erb" })
  end

  def refresh_matches
    # Clear users matches
    Match.where({ :user_id => @current_user.id }).destroy_all
    
    all_pets = Pet.all

    if @current_user.interest == nil
      # alert, set preferences first
    else
      all_pets.each do |a_pet|
        match_strength = 0
        if a_pet.children_competability_ranking >= @current_user.interest.children_competability_preference
          match_strength = match_strength + 15
        end
        if a_pet.dog_competability_ranking >= @current_user.interest.dog_competability_preference
          match_strength = match_strength + 15
        end
        if a_pet.cat_competability_ranking >= @current_user.interest.cat_competability_preference
          match_strength = match_strength + 15
        end
        if a_pet.home_alone_competability_ranking >= @current_user.interest.home_alone_competability_preference
          match_strength = match_strength + 15
        end
        if a_pet.activity_competability_ranking >= @current_user.interest.activity_competability_preference
          match_strength = match_strength + 15
        end


        if a_pet.status == "Available for adoption" && @current_user.interest.interested_in_adopting_dogs == false && a_pet.species == "Dog"
          match_strength = 0
        end
        if a_pet.status == "Available for adoption" && @current_user.interest.interested_in_adopting_cats == false && a_pet.species == "Cat"
          match_strength = 0
        end
        if a_pet.status == "Available for foster" && @current_user.interest.interested_in_fostering_dogs == false && a_pet.species == "Dog"
          match_strength = 0
        end
        if a_pet.status == "Available for foster" && @current_user.interest.interested_in_fostering_cats == false && a_pet.species == "Cat"
          match_strength = 0
        end
        if match_strength > 50
          the_match = Match.new
          the_match.pet_id = a_pet.id
          the_match.user_id = @current_user.id
          the_match.match_strength = match_strength
          if the_match.valid?
            the_match.save
          end
        end
      end
    end

      redirect_to("/matches", { :notice => "Matches updated successfully." })
  end

  def show
    the_id = params.fetch("path_id")

    matching_matches = Match.where({ :id => the_id })

    @the_match = matching_matches.at(0)

    render({ :template => "matches/show.html.erb" })
  end

  def create
    the_match = Match.new
    the_match.pet_id = params.fetch("query_pet_id")
    the_match.user_id = params.fetch("query_user_id")
    the_match.match_strength = params.fetch("query_match_strength")

    if the_match.valid?
      the_match.save
      redirect_to("/matches", { :notice => "Match created successfully." })
    else
      redirect_to("/matches", { :notice => "Match failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_match = Match.where({ :id => the_id }).at(0)

    the_match.pet_id = params.fetch("query_pet_id")
    the_match.user_id = params.fetch("query_user_id")
    the_match.match_strength = params.fetch("query_match_strength")

    if the_match.valid?
      the_match.save
      redirect_to("/matches/#{the_match.id}", { :notice => "Match updated successfully."} )
    else
      redirect_to("/matches/#{the_match.id}", { :alert => "Match failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_match = Match.where({ :id => the_id }).at(0)

    the_match.destroy

    redirect_to("/matches", { :notice => "Match deleted successfully."} )
  end
end
