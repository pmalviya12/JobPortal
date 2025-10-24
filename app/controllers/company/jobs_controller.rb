class Company::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = current_company.jobs
  end

  def new
    @job = current_company.jobs.new
  end

  def create
    @job = current_company.jobs.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    @job = current_company.jobs.find(params[:id])
  end

  def edit
    @job = current_company.jobs.find(params[:id])
  end

  def update
    @job = current_company.jobs.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    @job = current_company.jobs.find(params[:id])
    @job.destroy
    redirect_to company_job_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :status, :description, :posted_by_id, :applicable_for, :job_type, :job_location, :salary_range, :total_positions)
  end
end
