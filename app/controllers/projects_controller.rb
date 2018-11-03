class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Le projet as été créer"
    else
      render 'new'
    end

    def edit

    end

    def update
      if @project.update(project_params)
        redirect_to @project, notice: "Mise à jour du projet effectuer"
      else
        render 'edit'
      end
    end

    def destroy
      @project.destroy
      redirect_to root_path, notice: "Projets supprimer"
    end

  end


  private
  def project_params
    params.require(:project).permit(:title, :content, :category_id)
  end
  def find_project
    @project = Project.find(params[:id])
  end
end
