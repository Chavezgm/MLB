require "rails_helper"

RSpec.describe Player, type: :feature do 
  describe 'players index' do

    #had to skip this bc of US 15 !!!!
    it 'displays all players' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      visit '/players'

      expect(page).to have_content(player1.name)
      expect(page).to have_content(player1.hall_of_fame)
      expect(page).to have_content(player1.games_played)

      # expect(page).to have_content(player2.name)
      # expect(page).to have_content(player2.hall_of_fame)
      # expect(page).to have_content(player2.games_played)

      # expect(page).to have_content(player3.name)
      # expect(page).to have_content(player3.hall_of_fame)
      # expect(page).to have_content(player3.games_played)
    end

    #had to skip this bc of US 15 !!!!
    it 'has a child index link' do 
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      visit '/teams'

      # save_and_open_page
      expect(page).to have_link("players")

      click_on("players")
      
      expect(current_path).to eq("/players")

      expect(page).to have_content(player1.name)
      # expect(page).to have_content(player2.name)
      # expect(page).to have_content(player3.name)
     
    end
  end

  describe 'US 15' do
    describe 'Child index' do
      it 'only shows true records' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)

        visit "/players"

        expect(page).to have_content(player1.name)

        expect(page).to_not have_content(player2.name)
        expect(page).to_not have_content(player3.name)
      end
    end
  end

  describe 'US 18' do
    describe 'Player update from players index page' do
      it 'updates a player from a players index' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)

        visit "/players"

        click_on("Update #{player1.name}")

        expect(current_path).to eq("/players/#{player1.id}/edit")

        fill_in("name", with: "Rodrigo Chavez")
        fill_in("hall_of_fame", with: true)
        fill_in('games_played', with: 700)

        click_on("Update Player")
        
        # save_and_open_page

        expect(page).to have_content("Rodrigo Chavez")
        expect(page).to have_content(true)

        expect(page).to_not have_content('Todd Helton')
      end
    end
  end

  describe 'US 23' do
   describe 'Deletes a player' do
     it 'Deletes a player from a players index page' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
        player4 = Player.create!(name: "Bob lob", hall_of_fame: true, games_played: 400, team_id:team2.id)

        visit "/players"

        click_on("Delete #{player4.name}")

        expect(current_path).to eq("/players")

        expect(page).to have_content("Todd Helton")

        expect(page).to_not have_content("Bob lob")
     end
   end
  end
end