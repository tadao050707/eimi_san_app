class UserStepsController < ApplicationController
  # before_action :set_user_step, only: %i[ show edit update destroy ]

  def first
    @user_choice = UserChoice.new
  end

  def second
    session[:vehicle] = user_choice_params[:vehicle]
    @user_choice = UserChoice.new
  end

  def third
    session[:cleaning] = user_choice_params[:cleaning]
    @user_choice = UserChoice.new
  end

  def fourth
    session[:active] = user_choice_params[:active]
    @user_choice= UserChoice.new
  end

  def fifth
    session[:exercise] = user_choice_params[:exercise]
    @user_choice = UserChoice.new
  end

  def sixth
    session[:home] = user_choice_params[:home]
    @user_choice = UserChoice.new
  end

  def create
    @user_choice = UserChoice.new(
      vehicle: session[:vehicle],
      cleaning: session[:cleaning],
      active: session[:active],
      exercise: session[:exercise],
      home: session[:last_name_kana], 
      house: session[:house]
    )
    if @user_choice.save
      session[:id] = @user.id
      redirect_to search_results_dogs_path
    else
      render '/signup/registration'
    end

  end

  private

  # def set_user_step
  #   @user_step = UserStep.find(params[:id])
  # end

  def user_choice_params
    params.require(:user_choice).permit(
      :vehicle, 
      :cleaning, 
      :active, 
      :exercise, 
      :home, 
      :house
    )
  end
end
