class Player < ApplicationRecord
 belongs_to :team 

 def self.true_records
  Player.where("hall_of_fame = true")
 end
end