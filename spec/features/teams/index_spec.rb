require "rails_helper"

RSpec.describe Team, type: :feature do 
  describe 'teams index' do
    it 'shows all teams' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )

      visit '/teams'

      expect(page).to have_content('Dodgers')
      expect(page).to have_content('Rockies')
      
    end

    it "shows teams sorted by most recent" do 
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true, created_at: Time.new(2021, 12, 03)  )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false,created_at: Time.new(2022, 10, 30) )
       
      visit '/teams'
      # save_and_open_page
      # expect(page).to have_content(team.name)
      expect(team2.name).to appear_before(team.name)
      # expect(page).to have_content(team2.name)

    end

    it 'has a parent index link' do
      team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
      team2 = Team.create!(name: "Rockies", year_founded:1993, world_series_appearance: false )
      player1 = Player.create!(name: "Todd Helton", hall_of_fame: true, games_played: 2247, team_id:team2.id)
      player2 = Player.create!(name: "Freddie Freeman", hall_of_fame: false, games_played: 100,team_id:team.id)
      player3 = Player.create!(name: "Mookie Betts", hall_of_fame: false, games_played: 200, team_id:team.id)
      
      visit '/players'

      expect(page).to have_link("teams")
      
      click_on("teams")
      # save_and_open_page
      
      expect(current_path).to eq("/teams")

      expect(page).to have_content(team.name)
      expect(page).to have_content(team2.name)
     
    end
  end

  describe 'US #17' do
    describe 'Team update from team index' do
      it 'updates a team from the index page' do
        team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
        
        visit "/teams"

        click_on("Update #{team.name}")

        fill_in("name", with: "San Francisco Giants")
        fill_in("year_founded", with: 1883)
        fill_in('world_series_appearance', with: false) #not true but just for the test

        click_on("Update Team")
        # save_and_open_page

        expect(page).to have_content('San Francisco Giants')
        expect(page).to have_content(1883)
        expect(page).to have_content(false)
        
        expect(page).to_not have_content("Dodgers")

      end
    end
  end
end