class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  
  def L4
    session[:c] ||= 0
    session[:c] = session[:c].to_i + 1
    render plain: session[:c]
  end
end
