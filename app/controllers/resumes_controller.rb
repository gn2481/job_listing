class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job, only:%i[new create]

  def new
    @resume = Resume.new
  end
  
  def create
    @resume = @job.resumes.new(resume_params)
    @resume.user = current_user
    if @resume.save
      redirect_to root_path, notice: "成功投遞履歷"
    else
      render :new , notice: "請再試一次！"
    end
  end
  
  private
  def find_job
    @job = Job.find(params[:job_id])
  end

  def resume_params
    params.require(:resume).permit(:cover_letter, :attachment)
  end
end
