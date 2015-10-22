require "rails_helper"

RSpec.feature "Signing user in with valid credentials" do

  before do
    @joy = User.create(email: "joy@example.com", password:"password")
  end

  scenario "Sign in users" do
    visit "/"
    click_link "Sign in"

    fill_in "Email", with: @joy.email
    fill_in "Password", with: @joy.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@joy.email}")
  end
end
