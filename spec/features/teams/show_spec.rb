require "rails_helper"

RSpec.describe Team, type: :feature do 
  describe 'teams show' do
    it 'shows a specific team and its attributes' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      
      visit "/teams/#{team.id}"
      
      expect(page).to have_content(team.name)
      expect(page).to have_content(team.year_founded)
      expect(page).to have_content(team.world_series_appearance)
      
      expect(page).to_not have_content(team2.name)
      expect(page).to_not have_content(team2.year_founded)
      expect(page).to_not have_content(team2.world_series_appearance)


    end

    it 'count of the number of players associated with this team' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
     
      visit "/teams/#{team.id}"
      # save_and_open_page
      expect(page).to have_content("Number of Players: 2")
    end
  end
end