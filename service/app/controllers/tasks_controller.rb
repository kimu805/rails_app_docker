class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to root_path, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
  end

  def show
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
