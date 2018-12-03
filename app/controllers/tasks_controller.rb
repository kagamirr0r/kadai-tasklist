class TasksController < ApplicationController
 before_action :task_find, only: [:show, :edit, :update, :destroy]

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
  
  if @task.save
   flash[:sucsses]  = 'Task が追加されました'
  redirect_to @message
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
  
  flash[:success] = 'Message は正常に削除されました'
  redirect_to tasks_url
 end
 
 private
 
 def task_find
 @task = Task.find(params[:id])
 end
 
 def task_params
    params.require(:task).permit(:content)
 end
 
end