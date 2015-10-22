require "rails_helper"

RSpec.feature "Signing users up" do

  scenario "With valid credentials" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: "joy@example.com"
    fill_in "Password", with: "Password"
    fill_in "Password confirmation", with: "Password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end
end
