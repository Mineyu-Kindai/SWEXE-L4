class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end
  
  def login
    if User.find_by(uid: params[:uid], pass: params[:pass]) != nil
      logger.debug "ログイン成功"
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      render "error", status: 442
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end


end
