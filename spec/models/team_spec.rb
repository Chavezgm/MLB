require "rails_helper"

RSpec.describe Team, type: :model do
  describe 'Associations' do 
    it { should have_many(:players) }
  end

  describe 'most_recently' do
    it 'orders the teams by most recently created' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true, created_at: Time.new(2021, 10, 31)  )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false,created_at: Time.new(2022, 10, 31) )

      expect(Team.most_recently).to eq([team2,team])
    end
  end

  describe 'players_count' do
    it 'returns the correct count of associated players' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      expect(team.players_count).to eq(2)
    end
  end


end