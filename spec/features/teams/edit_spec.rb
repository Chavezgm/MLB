require "rails_helper"

RSpec.describe "the teams update" do
  it 'links to the edit page from the team show page' do
    team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )
    
    visit "/teams/#{team.id}"

    click_on "Update #{team.name}"

    expect(current_path).to eq("/teams/#{team.id}/edit")
   
  end 

  it 'can edit a team' do
    team = Team.create!(name: "Dodgers", year_founded:1884, world_series_appearance: true )

    visit "/teams/#{team.id}/edit"
    # save_and_open_page
    fill_in("name", with: "Cubs")
    fill_in("year_founded", with: 1870)
    fill_in('world_series_appearance', with: false) #not true but just for the test
    
    click_on "Update Team"

    expect(current_path).to eq("/teams/#{team.id}")
    expect(page).to have_content('Cubs')

    expect(page).to_not have_content('Dodgers')
  end
end