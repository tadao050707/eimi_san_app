class UserChoicesController < ApplicationController
  def index
    @user_choices = UserChoice.all
  end

  def new
    @user_choice = UserChoice.new
  end

  def create
    @user_choices = UserChoice.new(
      vehicle: session[:vehicle],
      cleaning: session[:cleaning],
      active: session[:active],
      exercise: session[:exercise],
      home: session[:last_name_kana], 
      house: session[:house]
    )
    if @user_choices.save
      session[:id] = @user.id
      redirect_to user_choices_path
    else
      render '/signup/registration'
    end
  end

  def edit
    
  end

  private

  def user_choice_params
    params.require(:user_choice).permit(:vehicle, :cleaning, :active, :exercise, :home, :house, :user_id)
  end
end
