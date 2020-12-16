class Admin::JobsController < ApplicationController
  before_action :find_job, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :require_is_admin
  
  def index
     @jobs = Job.all.order("created_at DESC")
  end
  def show 
  end

  def new 
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "職缺新增成功"
    else
      render :new 
    end
  end
  
  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "職缺更新成功"
    else
      reder :edit
    end
  end

  def destroy
    if @job.destroy
      redirect_to admin_jobs_path, notice: "職缺刪除成功"
    else
      redirect_to admin_jobs_path, notice: "請再試一次！"
    end
  end

  private
  def find_job
    @job = Job.find(params[:id])
  end

  def job_params 
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end
end
