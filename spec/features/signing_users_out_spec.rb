require "rails_helper"

RSpec.feature "Signing users out" do

  before do
    @joy = User.create(email: "Joy@example.com", password: "password")

    visit "/"
    click_link "Sign in"

    fill_in "Email", with: @joy.email
    fill_in "Password", with: @joy.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@joy.email}")
  end

  scenario "Signing user out" do
    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")
  end
end
