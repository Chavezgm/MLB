require "rails_helper"

RSpec.describe Player, type: :model do 
  describe '#method_name' do
    it {should belong_to (:team)}
  end

  describe 'true_record' do
    it 'only shows players that have gone to the hall of fame' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      expect(Player.true_records).to eq([player1])
      expect(Player.true_records).to_not eq([player2,player3])
    end
  end

  describe 'alphabetical_order' do
    it 'orders alphabetically' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      
      expect(Player.alphabetical_order).to eq([player2,player3,player1])
    end
  end
end