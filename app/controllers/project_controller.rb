class ProjectController < ApplicationController


  def index
  	unless session[:current_user_id].nil?
  	 	@projects = Project.where user_id = session[:current_user_id]
      # render text:  session[:current_user_id]
  	else
  		@projects = Project.where status = Project::STATUS_ONLINE
  	end
  end

  def new

      unless params[:id].nil?   
  	      @project = Project.find_by("id = ? AND user_id = ?", params[:id], session[:current_user_id])  
          render json: @project.to_json 
      end
  end

  def create
      unless params[:inputName].nil? && params[:inputDesc].nil?
        
  		  @project = Project.create name: params[:inputName], desc: params[:inputDesc], status: 0
      else

  	  end

  	  unless params[:project_id].nil?
          @project = Project.find_by("id = ? AND user_id = ?", params[:project_id], session[:current_user_id])  unless params[:project_id].nil?
          project_detail = ProjectDetail.new 
          project_detail.amount     = params[:inputAmount]
          project_detail.start      = params[:inputStar]
          project_detail.min_amount = params[:inputMinAmount]
          project_detail.people     = params[:inputPeple]
          project_detail.min_amount = params[:inputMinAmount]
          project_detail.end        = params[:inputEnd]
          project_detail.save
          @project.project_detail   = project_detail;
          @project.status           = 1
          @project.save

  	  end
  end

  def list
  end
end
