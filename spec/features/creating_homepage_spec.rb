require "rails_helper"

RSpec.feature "Creating Home Page" do
  scenario "Home page should have 2 links and workout content" do
    visit "/"

    expect(page).to have_link("Athletes Den")
    expect(page).to have_link("Home")
    expect(page).to have_content("Workout Lounge")
  end
end
