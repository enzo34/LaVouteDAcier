class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
      @projects = Project.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @projects = Project.where(category_id: @category_id).order("created_at DESC")
    end
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
