class InterestsController < ApplicationController
  def index
    matching_interests = Interest.all

    @list_of_interests = matching_interests.order({ :created_at => :desc })

    render({ :template => "interests/index.html.erb" })
  end

  # def show
  #   matching_interests = Interest.where({ :user_id => @current_user.id })

  #   @the_interest = matching_interests.at(0)

  #   render({ :template => "interests/show.html.erb" })
  # end

  def create
    the_interest = Interest.new
    the_interest.user_id = @current_user.id
    the_interest.interested_in_fostering_dogs = params.fetch("query_interested_in_fostering_dogs", false)
    the_interest.interested_in_fostering_cats = params.fetch("query_interested_in_fostering_cats", false)
    the_interest.interested_in_adopting_dogs = params.fetch("query_interested_in_adopting_dogs", false)
    the_interest.interested_in_adopting_cats = params.fetch("query_interested_in_adopting_cats", false)
    the_interest.children_competability_preference = params.fetch("children_competability_preference_box")
    the_interest.dog_competability_preference = params.fetch("dog_competability_preference_box")
    the_interest.cat_competability_preference = params.fetch("cat_competability_preference_box")
    the_interest.activity_competability_preference = params.fetch("activity_competability_preference_box")
    the_interest.home_alone_competability_preference = params.fetch("home_alone_competability_preference_box")

    if the_interest.valid?
      the_interest.save
      redirect_to("/interests/update", { :notice => "Interest created successfully." })
    else
      redirect_to("/interests", { :notice => "Interest failed to create successfully." })
    end
  end

  def update
    the_interest = Interest.where({ :user_id => @current_user.id }).at(0)

    the_interest.interested_in_fostering_dogs = params.fetch("query_interested_in_fostering_dogs", false)
    the_interest.interested_in_fostering_cats = params.fetch("query_interested_in_fostering_cats", false)
    the_interest.interested_in_adopting_dogs = params.fetch("query_interested_in_adopting_dogs", false)
    the_interest.interested_in_adopting_cats = params.fetch("query_interested_in_adopting_cats", false)
    the_interest.children_competability_preference = params.fetch("children_competability_preference_box")
    the_interest.dog_competability_preference = params.fetch("dog_competability_preference_box")
    the_interest.cat_competability_preference = params.fetch("cat_competability_preference_box")
    the_interest.activity_competability_preference = params.fetch("activity_competability_preference_box")
    the_interest.home_alone_competability_preference = params.fetch("home_alone_competability_preference_box")

    if the_interest.valid?
      the_interest.save
      redirect_to("/interests/update", { :notice => "Interest updated successfully."} )
    else
      redirect_to("/interests/update", { :alert => "Interest failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.destroy

    redirect_to("/interests", { :notice => "Interest deleted successfully."} )
  end
end
