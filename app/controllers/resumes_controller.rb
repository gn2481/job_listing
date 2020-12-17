class ResumesController < ApplicationController
  before_action :find_resume, only:%i[show edit update destroy ]

  def index
    @resumes = Resume.all
  end

  def show
  end
  
  def new
    @resume = Resume.new
  end
  
  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to root_path, notice: "成功投遞履歷"
    else
      render :new , notice: "請再試一次！"
    end
  end
  
  def edit
  end

  def update
    @resume = Resume.update(resume_params)
    if @resume.save
      redirect_to root_path, notice: "成功修改履歷"
    else
      render :edit , notice: "請再試一次！"
    end
  end

  def destroy
    if @resume.destroy
      redirect_to root_path, notice: "成功刪除履歷"
    else
      redirect_to root_path, notice: "請再試一次"
    end
  end
  

  private
  def find_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit()
  end
end
