require "rails_helper"

RSpec.describe "players update" do
  describe 'US 14' do
    describe 'players update #PART1' do 
      it 'goes to the player edit page ' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)

        visit "/players/#{player1.id}"

        click_on("Update Player")

        expect(current_path).to eq("/players/#{player1.id}/edit")
      end
    end 
  end

  describe 'US 14' do
    describe 'Player update #PART2' do
      it 'updates a player with new attributes' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
        player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
        player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
        player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)

        visit "/players/#{player1.id}/edit"

        fill_in("name", with: "Todd Helton")
        fill_in("hall_of_fame", with: false)
        fill_in('games_played', with: 300)

        click_on("Update Player")

        expect(current_path).to eq("/players/#{player1.id}")

        expect(page).to have_content(false)
        expect(page).to have_content(300)
      end
    end 
  end
end