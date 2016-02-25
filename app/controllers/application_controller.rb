class ApplicationController < ActionController::Base
  config.time_zone = 'Eastern Time (US & Canada)'
  protect_from_forgery with: :exception
  include SessionsHelper
  include EventsHelper

  private
    def signed_in_user?
      unless signed_in?
        flash[:danger] = "Please sign in"
        redirect_to signin_path
      end
    end
end
