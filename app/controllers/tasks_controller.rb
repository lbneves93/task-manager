class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.includes(:user).all
    render json: TaskSerializer.new(@tasks).serializable_hash
  end

  # GET /tasks/:id
  def show
    render json: TaskSerializer.new(@task).serializable_hash
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: TaskSerializer.new(@task).serializable_hash, status: :ok
    else
      render json: { errors: @task.errors.full_messages }, status: :bad_request
    end
  end

  # PATCH/PUT /tasks/:id
  def update
    if @task.update(task_params)
      render json: TaskSerializer.new(@task).serializable_hash, status: :ok
    else
      render json: { errors: @task.errors.full_messages }, status: :bad_request
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Task not found' }, status: :not_found
  end

  def task_params
    params.require(:task).permit(:user_id, :title, :description, :status, :due_date)
  end
end
