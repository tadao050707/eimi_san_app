class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!, except: [:top]
  before_action :set_locale
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def set_locale
    if ["ja", "en"].include?(cookies[:locale])
      I18n.locale = cookies[:locale]
    end
  end
  private


end
