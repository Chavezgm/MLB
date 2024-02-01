require "rails_helper"

RSpec.describe "the Team creation" do

  describe 'creates new team' do
    it 'links to the new page from the teams index' do
      visit "/teams"

      click_link("New Team")

      expect(current_path).to eq('/teams/new')
    end

    it "creates a new team" do 
      visit "/teams/new"

      fill_in('name', with: "Red Soxs")
      fill_in('year_founded', with: 1901)
      fill_in('world_series_appearance', with: true)

      click_on("Create Team")

      expect(current_path).to eq("/teams")
      expect(page).to have_content('Red Soxs')
    end
  end
end
