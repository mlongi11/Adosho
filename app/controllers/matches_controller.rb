class MatchesController < ApplicationController
  def index
    matching_matches = Match.all

    @list_of_matches = matching_matches.order({ :created_at => :desc })

    render({ :template => "matches/index.html.erb" })
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
