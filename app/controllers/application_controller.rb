class ApplicationController < ActionController::API

    include ActionController::Cookies
    before_action :authorize

    private
    def authorize
      unless current_user
        redirect_to login_url, alert: "Please log in"
      end
    end
    
    def current_user
       @current_user ||= User.find_by(id: session[:user_id])
    end
end
