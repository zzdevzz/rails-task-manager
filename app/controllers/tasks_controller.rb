class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # this before_action method will run the function 'set_task' on the actions below so code is more DRY.

  def index
    @tasks = Task.all
  end

  def show
    id = params[:id]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.delete
    redirect_to tasks_path status: :see_other
  end

  private

  # Can't save to database without 'strong params', giving permissing on this fields only to be inputted.
  # Prevents other inputs from hackers messing up database with new fields.
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
