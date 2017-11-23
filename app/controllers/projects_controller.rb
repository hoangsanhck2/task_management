class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def show
        @project = Project.find_by(params[:id])
        @listProjectTask = Task.where(project_id: @project)
    end

    def create
        @project = Project.new(project_params)
  
        if @project.save
            redirect_to projects_path
        else
            render 'new'
        end
    end
    
    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
    
        if @project.update_attributes(project_params)
            redirect_to projects_path
        else
            render 'edit'
        end
    end

    def destroy_all
        @listProjectId = params[:listProject][:chk]

        Project.where(id: @listProjectId).destroy_all

        redirect_to projects_path
    end
    private
        def project_params
            params.require(:project).permit(:name, :text)
        end
end
