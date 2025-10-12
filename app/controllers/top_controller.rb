class TopController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uid: params[:user][:uid])
    @user.pass = BCrypt::Password.create(params[:user][:pass])
    
    if @user.save
      redirect_to top_main_path
    else
      render "new"
    end
  end
  
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end
  
  def login
    
    user = User.find_by(uid: params[:uid])
    
    if user != nil and BCrypt::Password.new(user.pass) == params[:pass]
      p "logged in!"
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
