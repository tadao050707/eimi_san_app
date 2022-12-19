class UserStepsController < ApplicationController
  # before_action :set_user_step, only: %i[ show edit update destroy ]

  def first
    @user_choice = UserChoice.new
  end

  def second
    # if session[:vehicle] || params[:user_choice][:vehicle]
    @user_choice = UserChoice.new
    if params[:user_choice]
      session[:vehicle] = user_choice_params[:vehicle]
      
    else
      # redirect_to first_user_steps_path unless session[:vehicle]
      # redirect_to second_user_steps_path
      render action: :first
    end
  end

  def third
    if params[:user_choice]
      session[:cleaning] = user_choice_params[:cleaning]
      @user_choice = UserChoice.new
    else
      @user_choice = UserChoice.new
      render action: :second
    end
  end

  def fourth
    if params[:user_choice]
      session[:active] = user_choice_params[:active]
      @user_choice= UserChoice.new
    else
      @user_choice = UserChoice.new
      render action: :third
    end
  end

  def fifth
    if params[:user_choice]
      session[:exercise] = user_choice_params[:exercise]
      @user_choice = UserChoice.new
    else
      @user_choice = UserChoice.new
      render action: :fourth
    end
  end

  def sixth
    if params[:user_choice]
      session[:home] = user_choice_params[:home]
      @user_choice = UserChoice.new
    else
      @user_choice = UserChoice.new
      render action: :fifth
    end
  end

  def create
    unless params[:user_choice]
      @user_choice = UserChoice.new
      return render :sixth 
    end
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
