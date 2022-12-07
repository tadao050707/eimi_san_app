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

  def matching_results
    @dogs = Dog.all
    @user_choices = UserChoice.where(user_id)
    user_choices = [ @user_choices.vehicle, @user_choices.cleaning, @user_choices.active, @user_choices.exercise, @user_choices.home, @user_choices.house ]
    @matching_rate = @dogs.pluck(:vehicle, :cleaning, :active, :exercise, :home, :house).map {|breed| (breed & user_choice).length*100/2}
  end

  private

  def user_choice_params
    params.require(:user_choice).permit(:vehicle, :cleaning, :active, :exercise, :home, :house, :user_id)
  end
end
