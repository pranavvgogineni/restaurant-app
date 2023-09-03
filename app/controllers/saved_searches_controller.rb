class SavedSearchesController < ApplicationController
  def index
    @saved_searches = SavedSearch.all
    render :index
  end

  def create
    @saved_search = SavedSearch.create(
      user_id: params[:user_id],
      radius: params[:radius],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      price_range: params[:price_range],
      cuisine: params[:price_range],
    )
    if @saved_search.valid?
      render :show
    else
      render json: { errors: @saved_search.errors.full_messages }, status: 422
    end
  end

  def show
    @saved_search = SavedSearch.find_by(id: params[:id])
    render :show
  end

  def update
    @saved_search = SavedSearch.find_by(id: params[:id])
    @saved_search.update(
      radius: params[:radius] || @saved_search.radius,
      city: params[:city] || @saved_search.city,
      state: params[:state] || @saved_search.state,
      state: params[:zip] || @saved_search.zip,
      price_range: params[:price_range] || @saved_search.price_range,
      cuisine: params[:cuisine] || @saved_search.cuisine,
    )
    render :show
  end
end
