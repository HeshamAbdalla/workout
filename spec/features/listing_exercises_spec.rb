require "rails_helper"

RSpec.feature "Listing Exercises" do
  before do
    @peter = User.create(email: "peter@example.com", first_name: "peter", last_name: "Ed", password: "password")
    @joy   = User.create(email: "Joy@example.com", first_name: "joy",last_name: "doe", password: "password")
    login_as(@joy)

    @e1 = @joy.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: "2015-08-09")
    @e2 = @joy.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: "2015-08-09")

    @following = Friendship.create(user: @joy, friend: @peter)
  end

  scenario "shows user's workout for last 7 dats" do
    visit "/"

    click_link "My Lounge"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end

  scenario "shows a list of users friends" do
    visit "/"

    click_link "My Lounge"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@peter.full_name)
    expect(page).to have_link("Unfollow")
  end
end
