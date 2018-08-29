class StationPresenter
  def initialize(key)
    @service = StationService.new(key)
  end

  def stations
    stations_hash.map do |station_data|
      st = Station.new(station_data)
    end
  end

  def stations_hash
    @service.stations_hash
  end
end
