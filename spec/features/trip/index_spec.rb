require 'rails_helper'

RSpec.describe "Hiking Trip Index" do

  # As a visitor,
  # when I visit the hiking trips index page,
  # I see a list of all hiking trip names in
  # the database.
  describe "as a visitor" do
    before :each do
      t = DateTime.now

      @trip_1 = Trip.create!(name: "Trip 1", start_date: t, end_date: t + 1)
      @trip_2 = Trip.create!(name: "Trip 2", start_date: t, end_date: t + 10)
      @trip_3 = Trip.create!(name: "Trip 3", start_date: t, end_date: t + 9)

      @PCN = @trip_1.trails.create!(name: "PCN", address: "forest", length: 106)
      @Manitou_Trail = @trip_2.trails.create!(name: "Manitou Trail", address: "forest", length: 106)
      @Greys = @trip_3.trails.create!(name: "Grey's", address: "forest", length: 106)
    end

    it "I see a list of all hiking trip names" do
      visit "/trips"

      expect(page).to have_content("Trip 1")
      expect(page).to have_content("Trip 2")
      expect(page).to have_content("Trip 3")
    end
  end


end
