class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]


  def index
    @projects = Project.page(params[:page]).per(3)
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = create_project.project

    if create_project.success?
      redirect_to projects_path, notice: "Created Successful"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if update_project.success?
      redirect_to projects_path, notice: "Update Successful"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    destroy_project
    redirect_to projects_path, notice: "Project destroyed"
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def create_project
    @create_project ||= ::Projects::Create.call(project_params: project_params)
  end

  def update_project
    ::Projects::Update.call(project: @project,
                            project_params: project_params)
  end

  def destroy_project
    ::Projects::Destroy.call(project: @project)
  end
end
