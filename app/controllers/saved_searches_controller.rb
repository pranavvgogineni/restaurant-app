class SavedSearchesController < ApplicationController
  before_action :authenticate_user

  def index
    @saved_searches = current_user.SavedSearch.all
    render :index
  end

  def create
    @saved_search = SavedSearch.create(
      user_id: current_user.id,
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
    @saved_search = current_user.SavedSearch.find_by(id: params[:id])
    render :show
  end

  def update
    @saved_search = current_user.SavedSearch.find_by(id: params[:id])
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

  def destroy
    @saved_search = current_user.SavedSearch.find_by(id: params[:id])
    @saved_search.destroy
    render json: { message: "Search destroyed successfully" }
  end
end
