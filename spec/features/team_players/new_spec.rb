require "rails_helper"

RSpec.describe "the Team player creation" do

  describe 'creates new team player ' do
    it 'links to the new page from the teams index' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      visit "/teams/#{team.id}/players"

      click_link("Create Player")

      expect(current_path).to eq("/teams/#{team.id}/players/new")
    end

    it "creates a new team player" do 
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      visit "/teams/#{team.id}/players/new"

      fill_in('name', with: "Rodrigo")
      fill_in('hall_of_fame', with: false)
      fill_in('games_played', with: 400)

      click_on("Create Player")

      expect(current_path).to eq("/teams/#{team.id}/players")
      expect(page).to have_content('Rodrigo')
    end
  end
end
