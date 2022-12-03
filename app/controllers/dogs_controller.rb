class DogsController < ApplicationController
  before_action :set_q, only: [:search, :search_results]

  def index
    @dogs = Dog.all
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
  end

  def search
  end
  
  def search_results
    @results = @q.result
  end

  private

  def set_q
    @q = Dog.ransack(params[:q])
  end

  def dog_params
    params.require(:dog).permit(:name, :size, :vehicle, :cleaning, :active, :exercise, :home, :house, :image_url)
  end

end
