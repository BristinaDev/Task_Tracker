class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :set_task, only: [:edit, :update, :mark_complete]

  def index
    @tasks_all = current_user.tasks.where(status: 'incomplete').where.not('due_date < ?', Date.today)
    @tasks_completed = current_user.tasks.where(status: 'completed')
    @tasks_overdue = current_user.tasks.where('due_date < ?', Date.today).where(status: 'incomplete')
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  
  def mark_complete
    @task.update(status: :completed)
    redirect_to tasks_path, notice: 'Task was successfully marked as complete.'
  end

  private
  def task_params
    params.require(:task).permit(:name, :due_date, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
