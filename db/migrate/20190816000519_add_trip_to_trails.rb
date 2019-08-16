class AddTripToTrails < ActiveRecord::Migration[5.1]
  def change
    add_reference :trails, :trip, foreign_key: true
  end
end
