class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
        custom_filter
    end

    def create
        @task = Task.new(task_params)
        custom_filter
        
        if @task.save
            redirect_to tasks_path
        else
            render 'new'
        end
    end

    def edit
        @task = Task.find(params[:id])
        custom_filter
    end

    def update
        @task = Task.find(params[:id])
        custom_filter
        if @task.update_attributes(task_params)
            redirect_to tasks_path
        else
            render 'edit'
        end
    end

    def destroy_all
        @listId = params[:listTask][:chk]
        
        Task.where(id: @listId).destroy_all

        redirect_to tasks_path
    end

    private
        def task_params
            params.require(:task).permit(:name, :priority, :project_id, :start_date, :end_date, :status)
        end

        def custom_filter
            Task::STATUS.each do |k,v|
                @hash_status[t(k)] = v
            end
            @project =  Project.all.collect { |p| [p.name, p.id]}
            @listpriority = { "Important and do now": 1,"Important and not urgent": 2, "Not Important and urgent": 3, "Not Important and not urgent": 4}
        end
end
