require 'rails_helper'
# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

describe 'A user searches for fuel stations' do
  context 'from the root page' do
    it 'entering their zipcode to see stations nearby' do
      visit '/'

      within(".navbar") do
        fill_in :q, with: 80203
        click_on "Locate"
      end

      expect(current_path).to eq(search_path)
      "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=80203&fuel_type=ELEC,LPG"
    end
  end
end
