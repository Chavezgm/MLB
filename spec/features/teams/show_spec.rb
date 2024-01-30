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
  end
end