class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

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

  def update
    @task.update!(task_params)
    redirect_to task_path(@task), notice: "タスク「#{@task.name}」を編集しました。"
  end

  def show
  end

  def destroy
    @task.destroy!
    redirect_to root_path, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end
end
