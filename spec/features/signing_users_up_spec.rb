require "rails_helper"

RSpec.feature "Signing users up" do

  scenario "With valid credentials" do
    visit "/"
    click_link "Sign up"

    fill_in "First name", with: "joy"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "joy@example.com"
    fill_in "Password", with: "Password"
    fill_in "Password confirmation", with: "Password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
    visit "/"
    expect(page).to have_content("joy Doe")
  end

    scenario "With invalid credentials" do
      visit "/"
      click_link "Sign up"

      fill_in "First name", with: ""
      fill_in "Last name", with: ""
      fill_in "Email", with: "joy@example.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"

      click_button "Sign up"

      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
    end
end
