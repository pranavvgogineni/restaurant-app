class SearchesController < ApplicationController
  def index
    results = Geocoder.search(params[:address])
    coordinates = results.first.coordinates
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=#{params[:cuisine]}&location=#{coordinates[0]}%2C#{coordinates[1]}&radius=#{params[:radius]}&type=restaurant&key=AIzaSyBJ7yHcf0lOrVWIQ1pJdUl5bj-OVjv1A98")

    data = JSON.parse(response.body)
    render json: data
  end
end
