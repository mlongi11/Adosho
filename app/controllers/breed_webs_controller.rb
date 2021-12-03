class BreedWebsController < ApplicationController
  def index
    matching_breed_webs = BreedWeb.all

    @list_of_breed_webs = matching_breed_webs.order({ :created_at => :desc })

    render({ :template => "breed_webs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_breed_webs = BreedWeb.where({ :id => the_id })

    @the_breed_web = matching_breed_webs.at(0)

    render({ :template => "breed_webs/show.html.erb" })
  end

  def create
    the_breed_web = BreedWeb.new
    the_breed_web.primary_breed_id = params.fetch("query_primary_breed_id")
    the_breed_web.similar_breed_id = params.fetch("query_similar_breed_id")

    if the_breed_web.valid?
      the_breed_web.save
      redirect_to("/breed_webs", { :notice => "Breed web created successfully." })
    else
      redirect_to("/breed_webs", { :notice => "Breed web failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_breed_web = BreedWeb.where({ :id => the_id }).at(0)

    the_breed_web.primary_breed_id = params.fetch("query_primary_breed_id")
    the_breed_web.similar_breed_id = params.fetch("query_similar_breed_id")

    if the_breed_web.valid?
      the_breed_web.save
      redirect_to("/breed_webs/#{the_breed_web.id}", { :notice => "Breed web updated successfully."} )
    else
      redirect_to("/breed_webs/#{the_breed_web.id}", { :alert => "Breed web failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_breed_web = BreedWeb.where({ :id => the_id }).at(0)

    the_breed_web.destroy

    redirect_to("/breed_webs", { :notice => "Breed web deleted successfully."} )
  end
end
