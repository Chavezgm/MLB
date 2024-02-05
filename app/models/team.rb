class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def self.most_recently
    order(created_at: :DESC)
  end

  def players_count 
    players.count
  end
end