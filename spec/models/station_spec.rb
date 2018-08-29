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
  end
end
