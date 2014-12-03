class UserController < ApplicationController
  before_action :param_valudate, :only => [:create]

  def login
  	unless params[:inputEmail].nil? && params[:inputPassword].nil?
  	  user = User.find_by mail: params[:inputEmail]
  	  if user.nil? == false && user.password == Digest::SHA256.hexdigest(params[:inputPassword])
  	  	session[:current_user_id] = user.id
  	  	session[:current_user_name] = user.mail
  	  	redirect_to controller: :project, action: :index
  	  else
  	    flash[:error] = "邮箱或密码不符"  	  	
  	  end
    end
  end  

  def register

  end

  def logout
  end

  def create
  	  unless User.find_by(name: params[:inputEmail]).nil?
  	    flash[:error] = "邮箱已注册"
  	    redirect_to :register	
  	  end

      pwd =  Digest::SHA256.hexdigest(params[:inputPassword])
      user = User.new
      user.password = pwd
      user.mail = params[:inputEmail]
      user.user_type = 0
      user.save

      flash[:success] = "感谢您注册BCF"
      redirect_to controller: :project, action: :index
  end

  private

  def param_valudate
  	if params[:inputPassword]!=params[:inputSecondPassword]
      flash[:error] = "密码不一致"
      redirect_to action: :register
    end
  end 
end
