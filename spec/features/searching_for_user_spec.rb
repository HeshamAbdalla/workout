require "rails_helper"

  RSpec.feature "Listing Members" do

    before do
    @joy = User.create(first_name: "Joy", last_name: "Doe", email: "Joy@example.com", password: "password")
    @john = User.create(first_name: "john", last_name: "Demaree", email: "john@example.com", password: "password")
    end

    scenario "with existing name returns all those users" do
      visit "/"

      fill_in "search_name", with: "Doe"
      click_button "Search"

      expect(page).to have_content(@joy.full_name)
      expect(page).to have_content(@joy.full_name)
      expect(current_path).to eq("/dashboard/search")
    end
  end
