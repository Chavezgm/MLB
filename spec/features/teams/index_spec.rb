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
      expect(page).to have_content(team.name)
      expect(page).to have_content(team2.name)


    end
  end
end