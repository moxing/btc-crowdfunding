class ProjectController < ApplicationController
  def index
  	unless session[:current_user_id].nil?
  	 	@projects = Project.where user_id: session[:current_user_id]
  	else
  		@projects = Project.all
  	end 
  end

  def new
  	  @project = Project.find_by id: params[:id]  unless params[:id].nil?
  end

  def create
      unless params[:inputName].nil? && params[:inputDesc].nil?
  		  @project = Project.create name: params[:inputName], desc: params[:inputDesc]  	
  	  end
  end

  def list
  end
end
