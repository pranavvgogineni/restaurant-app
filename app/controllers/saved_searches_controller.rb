class SavedSearchesController < ApplicationController
  def index
    @saved_searches = SavedSearch.all
    render :index
  end
end