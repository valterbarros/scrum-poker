class TasksController < ApplicationController
  def index
  end
  
  def create
  	@task = Task.new(task_params)
  	
  	respond_to do |format|
	  	if @task.save
	  		format.html { redirect_to @task, notice: "Task was successfully created." }		
	  	else
	  		format.html { render :new }
	  	end
  	end
  end

	private
  def task_params
  	params[:params]
  	#params.require(:tasks).permit(:title,:description)
  end
end
