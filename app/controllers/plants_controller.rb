class PlantsController < ApplicationController
  def index
    response = HTTP.get("https://perenual.com/api/species-list?key=#{ENV["PERENUAL_API_KEY"]}")
    data = response.parse["data"].shuffle
    render json: data
  end
end
