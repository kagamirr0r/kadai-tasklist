class TasksController < ApplicationController
 before_action :task_find, only: [:show, :edit, :update, :destroy]
 before_action :require_logged_in
 before_action :correct_user, only:[:destroy]
 

 def index
  @tasks = Task.all
 end
 
 def show
 end
 
 def new
  @task = Task.new
 end
 
 def create
  @task = Task.new(task_params)
  @task.user = current_user
  
  if @task.save
   flash[:sucsses]  = 'Task が追加されました'
  redirect_to @task
  else
   flash.now[:danger] = "Taskが追加できません"
   render :new
  end
 end
 
 def edit
 end
 
 def update
   if @task.update(task_params)
    flash[:success] = 'Task は正常に更新されました'
    redirect_to @task
   else
    flash.now[:danger] = 'Task は更新されませんでした'
    render :edit
   end
 end
 
 def destroy
  @task.destroy
  flash[:success] = 'Task は正常に削除されました'
  redirect_to tasks_url
 end
 
 private
 
 def task_find
 @task = Task.find(params[:id])
 end
 
 def task_params
    params.require(:task).permit(:content, :status)
 end
 def correct_user
  @task = current_user.tasks.find_by(id: params[:id])
  
  unless @task
   redirect_to root_url
  end
 end

end