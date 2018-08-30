class StationPresenter
  def initialize(key, location)
    @service = StationService.new(key, location)
  end

  def stations
    stations_array.map do |station_data|
      st = Station.new(station_data)
    end
  end

  def stations_array
    @service.stations_array
  end
end
