class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # particular task -> in instance variable to retrieve in view
    @task = Task.find(params[:id])
  end
end
