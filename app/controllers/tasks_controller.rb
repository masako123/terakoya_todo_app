class TasksController < ApplicationController
  before_action :sign_in_required, only: [:show]
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_status]

  # GET /tasks
  # GET /tasks.json
  def index
    # /tasks　-> created_at順にsortされたTask.allが表示される。
    # /tasks?order_by=due_date_at　-> due_date_at順にsortされたTask.allが表示される。
    # /tasks?assignee_id=1 -> 指定したassigneeごとのtasksが表示される。
    # /tasks?user_id=1 -> 指定したuserごとのtasksが表示される。
    # /tasks?due_date_at=2019-01-01 -> 指定した日付のtasksが表示される。
    # /tasks?order_by=due_date_at＆assignee_id=1&user_id=1&due_date_at=2019-01-01

    if params[:order_by].present?
      column = params[:order_by].to_sym
    else
      column = :created_at
    end
    @tasks = Task.order_by(column)
    
    if params[:assignee_id].present?
      @assignee = User.find(params[:assignee_id])
      @tasks = @tasks.by_assignee(@assignee)
    end

    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @tasks = @tasks.by_user(@user)
    end

    if params[:due_date_at].present?
      @date = params[:due_date_at].to_sym
      @tasks = @tasks.by_due_date_at(@date)
    end

    render json: @tasks if request.xhr?
  end

  def toggle_status
    if @task.toggle_status!
      if request.xhr?
        render json: @task.as_json 
      else 
        redirect_to @task, notice: "タスク「#{@task.name}」が「#{@task.status_i18n}」に更新されました。"
      end
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new task_params

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update task_params
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id] || params[:task_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :content, :image, :due_date_at, :assigned_user_id, :user_id)
    end
end
