class SearchController < ApplicationController
  def index
    @stations = StationPresenter.new(ENV['API_KEY']).stations
  end
end
