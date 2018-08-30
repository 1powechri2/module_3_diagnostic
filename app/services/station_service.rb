class StationService
  def initialize(key, location)
    @key = key
    @location = location
  end

  def conn
    Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def stations_response
    @stations_response ||= conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{@key}&location=#{@location}&radius=6.0&fuel_type=ELEC,LPG&limit=10")
  end

  def stations_json
    JSON.parse(stations_response.body, symbolize_names: true)
  end

  def stations_array
    stations_json[:fuel_stations]
  end
end
