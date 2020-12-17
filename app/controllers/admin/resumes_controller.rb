class Admin::ResumesController < ApplicationController
  layout "admin"
  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.includes(:user)
  end

  def show
    @resumes = resumes.find(params[:id])
  end

end
