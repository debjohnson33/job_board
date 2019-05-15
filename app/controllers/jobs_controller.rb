class JobsController < ApplicationController
    helper_method :sort_column, :sort_direction
    def index
        @jobs = Job.order(sort_column + " " + sort_direction)
    end

    def show
        @job = Job.find(params[:id])
    end

    def new
        @job = Job.new
    end

    def create
        job = Job.new(job_params)
        if job.save
            flash[:notice] = "New job was added."
            redirect_to job_path(job)
        else
            render :new
        end 
    end

    def edit
        @job = Job.find(params[:id])
    end

    def update
        @job = Job.find(params[:id])
        @job.update_attributes(job_params)
        redirect_to jobs_path
    end

    def destroy
        @job = Job.find(params[:id])
        @job.destroy
        redirect_to jobs_path
    end

    private

    def job_params
        params.require(:job).permit(:title, :description)
    end

    def sort_column
        Job.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
