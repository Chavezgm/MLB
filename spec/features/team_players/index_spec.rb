require "rails_helper"
# frozen_string_literal: true

RSpec.describe Player  do
  describe "team player index" do
    it " shows a teams players " do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      visit "/teams/#{team.id}/players"

      expect(page).to have_content(player2.name)
      expect(page).to have_content(player2.hall_of_fame)
      expect(page).to have_content(player2.games_played)
      
      expect(page).to_not have_content(player1.name)
      expect(page).to_not have_content(player1.hall_of_fame)
      expect(page).to_not have_content(player1.games_played)
      # save_and_open_page

    end
  end

  describe '#US 16' do
    describe 'Team players ' do
      it 'it orders a teams players in alphabetical order by name' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)

        visit "/teams/#{team.id}/players"

        expect(player3.name).to appear_before(player2.name)

        click_link("Sort Players Alphabetically")

        expect(current_path).to eq("/teams/#{team.id}/players")
        # save_and_open_page
        expect(player2.name).to appear_before(player3.name)
        
      end
    end
  end

  describe 'US 21' do 
    describe 'Team players ' do
      it 'Displays Over a Given Threshold ' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
        player4 = Player.create!(name: "Jackie Robinson", hall_of_fame: true, games_played: 1000,team_id:team.id)
        player5 = Player.create!(name: "David Ortiz", hall_of_fame: false, games_played: 500,team_id:team.id)

        visit "/teams/#{team.id}/players"

        # save_and_open_page

        within '.games_over' do 
          fill_in 'Games played above', with: 250
          
          click_on("Submit")
        end
        # save_and_open_page
        expect(current_path).to eq("/teams/#{team.id}/players")
      
        expect(page).to have_content(player4.name)
        expect(page).to have_content(player5.name)

        expect(page).to_not have_content(player2.name)
        expect(page).to_not have_content(player3.name)
      end
    end
  end

  describe 'US 23 for Team_players' do
    describe 'Deletes a team player' do
      it 'deletes a team player' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
        player4 = Player.create!(name: "Jackie Robinson", hall_of_fame: true, games_played: 1000,team_id:team.id)
        player5 = Player.create!(name: "David Ortiz", hall_of_fame: false, games_played: 500,team_id:team.id)
       
        visit "/teams/#{team.id}/players"

        click_on("Delete #{player4.name}")

        expect(current_path).to eq("/teams/#{team.id}/players")

        expect(page).to have_content('David Ortiz')
        #  save_and_open_page
        expect(page).to_not have_content('Jackie Robinson')
      end
    end
  end
end
