require "rails_helper"

RSpec.describe Player, type: :feature do 
  describe 'players show' do
    it 'shows a players attributes' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      visit "/players/#{player1.id}"
      # save_and_open_page
      expect(page).to have_content(player1.name)
      expect(page).to have_content(player1.hall_of_fame)
      expect(page).to have_content(player1.games_played)
    end
  end

  describe 'US #20' do
    describe 'Players delete' do
      it 'deletes a player' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: true , games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
        player4 = Player.create!(name: "Rodrigo", hall_of_fame: true, games_played: 300, team_id:team.id)
        
        #Mookie and Freddie are not going to show up on the players index because of US 15
        #US 15: Players Index only shows `true` Records
        visit "players/#{player1.id}"
        # save_and_open_page

        expect(page).to have_content('Todd Helton')
        
        click_on("Delete #{player1.name}")
        
        expect(current_path).to eq("/players")

        expect(page).to_not have_content('Todd Helton')
        # save_and_open_page
        expect(page).to have_content('Rodrigo')
  


      end
    end
  end
end