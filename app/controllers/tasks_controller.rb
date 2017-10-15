class TasksController < ApplicationController
  
  before_action :set_task, :only => [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: 'Task was sucessfully created'
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end 

  def update
    if @task.update_attributes(task_params)
      redirect_to task_path(@task)
    else
      render :action => :edit
    end
  end 

  def destroy
    @task.destroy

    redirect_to tasks_url, notice: 'Task was sucessfully created'
  end
  

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task, :due_date, :details, :completed)
  end

end
