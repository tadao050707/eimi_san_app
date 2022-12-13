class LanguagesController < ApplicationController
  def locale
    if ["ja", "en"].include?(params[:locale])
      cookies[:locale] = params[:locale]
      redirect_to :root
    end
  end
end
