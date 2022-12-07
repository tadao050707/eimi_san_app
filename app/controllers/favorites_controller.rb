class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(dog_id: params[:dog_id])
    redirect_to dog_path(params[:dog_id])
  end

  def destroy
    @favorite = current_user.favorites.find_by(dog_id: params[:id]).destroy
    redirect_to dog_path(params[:id])
  end
end

