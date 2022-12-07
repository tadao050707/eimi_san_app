class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(dog_id: params[:dog_id])
  end

  def destroy
    @favorite = current_user.favorites.create(dog_id: params[:dog_id]).delete
  end
end

