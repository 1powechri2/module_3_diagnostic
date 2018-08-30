class SearchController < ApplicationController
  def index
    @stations = StationPresenter.new(ENV['API_KEY'], params['q']).stations
  end
end
