class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(dog_id: params[:dog_id])
  end

  def delete
    @favorite = current_user.favorites.create(dog_id: params[:dog_id]).destroy
  end
end
