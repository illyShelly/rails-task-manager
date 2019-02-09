class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # READ
  def index
    @tasks = Task.all
  end

  def show
    # particular task -> in instance variable to retrieve in view
    # @task = Task.find(params[:id])
    set_task
  end
  # CREATE -> form + post request
  def new
    @task = Task.new
  end

  def create
    # raise ActiveModel::ForbiddenAttributesError -> it is not save
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    @task.save
    # to do some staff -> redirect to all tasks (it saved)
    redirect_to tasks_path
  end

  # UPDATE -> 2 actions => EDIT form + path request
  def edit
    # @task = Task.find(params[:id])
    set_task
  end

  def update
    # @task = Task.find(params[:id])
    set_task
    # @task.update(params[:task])
    @task.update(task_params)
    # after update go to tasks
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    set_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
