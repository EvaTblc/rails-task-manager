class TasksController < ApplicationController

  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_tasks)
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(params_tasks)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def params_tasks
    params.require(:task).permit(:title, :details)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
end
