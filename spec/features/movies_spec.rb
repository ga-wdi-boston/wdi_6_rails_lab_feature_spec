require 'spec_helper'

feature "Manage Movies" do

  background do 
    Movie.create(title: "Star Trek", year: 1979)
  end

  scenario "View all movies as a vistor" do
    # Capybara 
    visit movies_path
    expect(page).to have_content('All Movies')
    expect(page).to have_content('Star Trek')
    expect(page).to have_content('1979')
  end

   scenario "Add a new movie" do
    visit movies_path
    click_link 'Add Movie'
    fill_in 'Title', with: 'Gravity'
    fill_in 'Year', with: '2013'
    save_and_open_page
    click_on 'Create Movie'
    # ... goto the index and check if Gravity is on where
    expect(page).to have_content('Gravity')
   end
end