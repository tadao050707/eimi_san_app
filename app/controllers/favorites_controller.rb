class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(dog_id: params[:dog_id])
    redirect_to dog_path(params[:dog_id])
  end

  def destroy
    dog = Dog.find(Favorite.find(params[:id]).dog_id)
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to dog_path(dog)
  end
end

