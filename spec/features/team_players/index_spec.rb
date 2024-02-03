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
end
