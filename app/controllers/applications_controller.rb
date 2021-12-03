class ApplicationsController < ApplicationController
  def index
    matching_applications = Application.all

    @list_of_applications = matching_applications.order({ :created_at => :desc })

    render({ :template => "applications/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_applications = Application.where({ :id => the_id })

    @the_application = matching_applications.at(0)

    render({ :template => "applications/show.html.erb" })
  end

  def create
    the_application = Application.new
    the_application.user_id = params.fetch("query_user_id")
    the_application.pet_id = params.fetch("query_pet_id")
    the_application.application_type = params.fetch("query_application_type")
    the_application.status = params.fetch("query_status")

    if the_application.valid?
      the_application.save
      redirect_to("/applications", { :notice => "Application created successfully." })
    else
      redirect_to("/applications", { :notice => "Application failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_application = Application.where({ :id => the_id }).at(0)

    the_application.user_id = params.fetch("query_user_id")
    the_application.pet_id = params.fetch("query_pet_id")
    the_application.application_type = params.fetch("query_application_type")
    the_application.status = params.fetch("query_status")

    if the_application.valid?
      the_application.save
      redirect_to("/applications/#{the_application.id}", { :notice => "Application updated successfully."} )
    else
      redirect_to("/applications/#{the_application.id}", { :alert => "Application failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_application = Application.where({ :id => the_id }).at(0)

    the_application.destroy

    redirect_to("/applications", { :notice => "Application deleted successfully."} )
  end
end
