class SubtasksController < ApplicationController
  before_action :set_subtask, only: [:show, :edit, :update, :destroy]

  # GET /subtasks
  # GET /subtasks.json
  def index
    @subtasks = Subtask.all
  end

  # GET /subtasks/1
  # GET /subtasks/1.json
  def show
  end

  # GET /subtasks/new
  def new
    @subtask = Subtask.new
  end

  # GET /subtasks/1/edit
  def edit
  end

  # POST /subtasks
  # POST /subtasks.json
  def create
    @task = Task.find(params[:task_id])
    @subtask = @task.subtasks.create(subtask_params)
    respond_to do |format|
      if @subtask.save
        format.js
      end
    end
  end

  # PATCH/PUT /subtasks/1
  # PATCH/PUT /subtasks/1.json
  def update
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.html { redirect_to @subtask, notice: 'Subtask was successfully updated.' }
        format.json { render :show, status: :ok, location: @subtask }
      else
        format.html { render :edit }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtasks/1
  # DELETE /subtasks/1.json
  def destroy
    @task = Task.find(params[:task_id])
    @subtask = @task.subtasks.find(params[:id])
    @subtask.destroy
    respond_to do |format|
      format.js {head :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtask
      @subtask = Subtask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtask_params
      params.require(:subtask).permit(:title, :task_id)
    end
end
