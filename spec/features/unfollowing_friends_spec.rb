require "rails_helper"

RSpec.feature "Unfollowing Friends" do
  before do
    @joy = User.create(email: "joy@example.com", first_name: "joy", last_name: "Doe", password: "password")
    @peter = User.create(email: "peter@example.com", first_name: "peter", last_name: "Ed", password: "password")

    login_as(@joy)
    @following = Friendship.create(user: @joy, friend: @peter)
  end

  scenario do
    visit "/"
    click_link "My Lounge"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@peter.full_name + " Unfollowed")
  end
end
