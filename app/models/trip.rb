class Trip < ApplicationRecord
  has_many :trails

  def total_distance
    trails.sum(:length)
  end

  def avg_distance
    trails.average(:length)
  end

  def longest_trail
    trails.order(:length).last
  end

  def shortest_trail
    trails.order(:length).first
  end
end
