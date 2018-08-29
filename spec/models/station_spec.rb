require 'rails_helper'

describe Station do
  it 'Can be created' do
    attributes = {name: ';lkdjfak',
                  address: '778 Bejkhe st',
                  fuel_type: ';lkdjfak',
                  distance: 0.7464,
                  access_time: '24hoiers'
                 }

    station = Station.new(attributes)

    expect(station.name).to eq(attributes[:name])
    expect(station.address).to eq(attributes[:address])
    expect(station.fuel_type).to eq(attributes[:fuel_type])
    expect(station.distance).to eq(attributes[:distance])
    expect(station.access_time).to eq(attributes[:access_time])
  end
end
