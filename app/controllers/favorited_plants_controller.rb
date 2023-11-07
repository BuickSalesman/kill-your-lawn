class FavoritedPlantsController < ApplicationController
  def index
    @favorited_plants = FavoritedPlant.all
    render :index
  end

  def create
    @favorited_plant = FavoritedPlant.find_or_create_by(
      user_id: params[:user_id],
      plant_api_id: params[:plant_api_id],
    )
    @favorited_plant.update(
      image_url: params[:image_url],
      scientific_name: params[:scientific_name],
    )
    render :show
  end

  def destroy
    @favorited_plant = FavoritedPlant.find_by(plant_api_id: params[:id])
    @favorited_plant.destroy
    render json: { message: "Plant unplanted" }
  end
end
