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
    # if params[:q] = "" &&  params[:q][:cleaning_eq] = "" && params[:q][:size_eq] = "" && params[:q][:home_eq] = ""
    #   redirect_to search_dogs_path
    # end
  end
  
  private
 

  
  def set_q
    @q = Dog.ransack(params[:q])
  end

  def dog_params
    params.require(:dog).permit(:name, :size, :vehicle, :cleaning, :active, :exercise, :home, :house, :image_url)
  end

end
