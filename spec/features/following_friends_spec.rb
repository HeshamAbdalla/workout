require "rails_helper"

RSpec.feature "Following Friends" do
  before do
    @joy = User.create(email: "joy@example.com", first_name: "joy", last_name: "Doe", password: "password")
    @peter = User.create(email: "peter@example.com", first_name: "peter", last_name: "Ed", password: "password")

    login_as(@joy)
  end

  scenario "if signed in succeeds" do
    visit "/"

    expect(page).to have_content(@joy.full_name)
    expect(page).to have_content(@peter.full_name)
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@joy.id}")

    link = "a[href='/friendships?friend_id=#{@peter.id}']"
    find(link).click

    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@peter.id}")
  end
end
