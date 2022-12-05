class UserChoicesController < ApplicationController
  def index
    @user_choices = UserChoice.all
  end

  def new
    @user_choice = UserChoice.new
  end

  def create
    @user_choice = UserChoice.create(user_choice_params)
  end

  def edit
    
  end

  private

  def user_choice_params
    params.require(:user_choice).permit(:vehicle, :cleaning, :active, :exercise, :home, :house, :user_id)
  end
end
