class StationPresenter
  def initialize(key)
    @service = StationService.new(key)
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
