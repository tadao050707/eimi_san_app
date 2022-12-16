class UserStepsController < ApplicationController
  # before_action :set_user_step, only: %i[ show edit update destroy ]

  def first
    @user_choice = UserChoice.new
  end

  def second
    if session[:vehicle] || params[:user_choice][:vehicle]
      session[:vehicle] = user_choice_params[:vehicle]
      @user_choice = UserChoice.new
    else
      redirect_to first_user_steps_path
    end
  end

  def third
    if session[:cleaning] || params[:user_choice][:cleaning]
      session[:cleaning] = user_choice_params[:cleaning]
      @user_choice = UserChoice.new
    else
      redirect_to second_user_steps_path
    end
  end

  def fourth
    if session[:active] || params[:user_choice][:active]
      session[:active] = user_choice_params[:active]
      @user_choice= UserChoice.new
    else
      redirect_to third_user_steps_path
    end
  end

  def fifth
    if session[:exercise] || params[:user_choice][:exercise]
      session[:exercise] = user_choice_params[:exercise]
      @user_choice = UserChoice.new
    else
      redirect_to fourth_user_steps_path
    end
  end

  def sixth
    if session[:home] || params[:user_choice][:home]
      session[:home] = user_choice_params[:home]
      @user_choice = UserChoice.new
    else
      redirect_to fifth_user_steps_path
    end
  end

  def create
    @user_choice = current_user.build_user_choice(
      vehicle: session[:vehicle],
      cleaning: session[:cleaning],
      active: session[:active],
      exercise: session[:exercise],
      home: session[:home], 
      house: user_choice_params[:house]
    )
    if @user_choice.save
      session[:id] = @user_choice.user_id
      redirect_to  matching_results_dogs_path
    else
      render 'new'
    end

  end

  private

  # def set_user_step
  #   @user_step = UserStep.find(params[:id])
  # end

  def user_choice_params
    params.require(:user_choice).permit(:vehicle, :cleaning, :active, :exercise, :home, :house, :user_id)
  end
end
