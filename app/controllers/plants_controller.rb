class PlantsController < ApplicationController
  def index
    response = HTTP.get("https://perenual.com/api/species-list?key=#{ENV["PERENUAL_API_KEY"]}&q=#{CGI.escape params[:query]}")
    pp response
    pp response.parse
    data = response.parse["data"].shuffle
    render json: data
  end

  def show
    response = HTTP.get("https://perenual.com/api/species/details/#{params[:id]}?key=#{ENV["PERENUAL_API_KEY"]}")
    pp response
    pp response.parse
    data = response.parse
    render json: data
  end

  def schedule
    id = params[:id]
    response = HTTP.get("https://perenual.com/api/species/details/#{params[:id]}?key=#{ENV["PERENUAL_API_KEY"]}")
    pp response.parse
    data = response.parse
    watering_general_benchmark = data["watering_general_benchmark"]
    message = "Give your #{id} liters of water every#{watering_general_benchmark}"

    Rufus::Scheduler.singleton.in("5s", tags: [message]) do
      puts message
    end
    data = Rufus::Scheduler.singleton.jobs.map do |job|
      { timestamp: Time.at(job.next_time.seconds), tags: job.tags }
    end
    render json: data
  end
end
