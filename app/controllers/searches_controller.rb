class SearchesController < ApplicationController
  def index
    results = Geocoder.search(params[:address])
    coordinates = results.first.coordinates
    response = HTTP.get()

    data = JSON.parse(response.body)
    render json: data
  end
end
