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
  end
end