require "rails_helper"

  RSpec.feature "Listing Members" do

    before do
    @joy = User.create(first_name: "Joy", last_name: "Doe", email: "Joy@example.com", password: "password")
    @john = User.create(first_name: "john", last_name: "Demaree", email: "john@example.com", password: "password")
    end

  scenario "shows a list of registered members " do
    visit "/"
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@joy.full_name)
    expect(page).to have_content(@john.full_name)
  end
end
