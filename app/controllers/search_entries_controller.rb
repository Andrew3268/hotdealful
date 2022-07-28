class SearchEntriesController < ApplicationController
  def index
    @search_entries = SearchEntry.where("title LIKE ? OR link LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%") if params[:query]
  end
end
