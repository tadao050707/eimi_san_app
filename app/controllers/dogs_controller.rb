class DogsController < ApplicationController
  before_action :set_q, only: [:search, :search_results]

  def index
    @dogs = Dog.page(params[:page])
  end

  def new
    @dog = Dog.new
  end

  def create
    Dog.create(dog_params)
    redirect_to dogs_url
  end

  def show
    @dog = Dog.find(params[:id])
    # puts current_user.favorites
    @user_favorite = current_user.favorites.select { |favorite| favorite.dog_id == @dog.id }[0]
  end

  def search
  end
  
  def search_results
    @results = @q.result.page(params[:page])
  end

  def matching_results
    @dogs = Dog.all
    @user_choices = UserChoice.where(user_id: current_user.id)
    user_choice = [ @user_choices.vehicle, @user_choices.cleaning, @user_choices.active, @user_choices.exercise, @user_choices.home, @user_choices.house ]
    puts user_choice
    @matching_rate = @dogs.pluck(:vehicle, :cleaning, :active, :exercise, :home, :house).map {|breed| (breed & user_choice).length*100/2}
  end

  private

  def set_q
    @q = Dog.ransack(params[:q])
  end

  def dog_params
    params.require(:dog).permit(:name, :size, :vehicle, :cleaning, :active, :exercise, :home, :house, :image_url)
  end

end
