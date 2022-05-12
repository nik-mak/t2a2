class ProjectsController < ApplicationController
  # REMOVE BEFORE DEPLOYING
  skip_before_action :verify_authenticity_token

  before_action :find_project, only: [:show, :update, :destroy]
  
  def index
    @projects = Project.all
  end

  def show
  end

  def create
    project = Project.create(project_params)
    redirect_to project
  end

  def update
    @project.update(project_params)
    redirect_to @project
  end

  def destroy
    user = @project.user
    @project.destroy
    redirect_to user_path(user.id)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    return params.permit(:name, :description, :user_id)
  end
end
