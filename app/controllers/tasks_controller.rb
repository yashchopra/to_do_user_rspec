class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def show
		@task = Task.find(params[:id])
	end
	def create
		@task = Task.new(task_params)
		@task.save

		respond_to do |format|
			if @task.save
				format.html {redirect_to task_path(@task)}
			else
				format.html {render :new}
			end
		end
	end

	private
	def task_params
		params.require(:task).permit(:name, :priority, :user_id)
	end
end
