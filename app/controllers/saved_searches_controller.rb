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
end
