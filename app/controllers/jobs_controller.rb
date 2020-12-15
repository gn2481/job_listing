class JobsController < ApplicationController
  before_action :find_job, only: %i[show edit update destroy]
  def index 
    @jobs = Job.all
  end

  def show 
  end

  def new 
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path, notice: "職缺新增成功"
    else
      render :new 
    end
  end
  
  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to root_path, notice: "職缺更新成功"
    else
      reder :edit
    end
  end

  def destroy
    if @job.destroy
      redirect_to root_path, notice: "職缺刪除成功"
    else
      redirect_to root_path, notice: "請再試一次！"
    end
  end

  private
  def find_job
    @job = Job.find(params[:id])
  end

  def job_params 
    params.require(:job).permit(:title, :description)
  end
end
