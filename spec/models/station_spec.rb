require 'rails_helper'

describe Station do
  it 'Can be created' do
    attributes = {:station_name => ';lkdjfak',
                  :street_address => '778 Bejkhe st',
                  :fuel_type_code => ';lkdjfak',
                  :distance => 0.7464,
                  :access_days_time => '24hoiers'
                 }

    station = Station.new(attributes)

    expect(station.name).to eq(attributes[:station_name])
    expect(station.address).to eq(attributes[:street_address])
    expect(station.fuel_type).to eq(attributes[:fuel_type_code])
    expect(station.distance).to eq(attributes[:distance])
    expect(station.access_time).to eq(attributes[:access_days_time])
  end
end
