require 'rails_helper'

RSpec.describe "trip show page" do
  # As a visitor,
  # when I visit the hiking trips index page,
  # and I click on the name of a hiking trip,
  # I see a unique page for that hiking trip.

  describe "as a visitor when I visit the hiking trips index" do
    before :each do
      t = DateTime.now

      @trip_1 = Trip.create!(name: "Trip 1", start_date: t, end_date: t + 1)
      @trip_2 = Trip.create!(name: "Trip 2", start_date: t, end_date: t + 10)
      @trip_3 = Trip.create!(name: "Trip 3", start_date: t, end_date: t + 9)

      @PCN = @trip_1.trails.create!(name: "PCN", address: "forest", length: 106)
      @BCN = @trip_1.trails.create!(name: "BCN", address: "forest", length: 4)
      @Manitou_Trail = @trip_2.trails.create!(name: "Manitou Trail", address: "forest", length: 106)
      @Greys = @trip_3.trails.create!(name: "Grey's", address: "forest", length: 106)

    end
    it "when I click on the name of a hiking trip" do
      visit "/trips"

      click_on "Trip 1"

      expect(current_path).to eq("/trips/#{@trip_1.id}")
      expect(page).to have_content(@PCN.name)
      expect(page).to have_content(110)
      expect(page).to have_content(55)
      expect(page).to have_content("Longest Trail on Trip")
      expect(page).to have_content("Name:#{@PCN.name}")
      expect(page).to have_content("Length:#{@PCN.length}")
      expect(page).to have_content("Name:#{@BCN.name}")
      expect(page).to have_content("Length:#{@BCN.length}")

      expect(page).to have_link("#{@PCN.name}")
      expect(page).to have_link("#{@BCN.name}")
    end
  end
end
