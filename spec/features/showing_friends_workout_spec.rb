require "rails_helper"

RSpec.feature "Showing Friends Workout" do
  before do
    @joy = User.create(email: "joy@example.com", first_name: "joy", last_name: "Doe", password: "password")
    @peter = User.create(email: "peter@example.com", first_name: "peter", last_name: "Ed", password: "password")

    @e1 = @joy.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: "2015-08-09")
    @e2 = @peter.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: "2015-08-09")

    login_as(@joy)
    @following = Friendship.create(user: @joy, friend: @peter)
  end

  scenario "shows friends workout for last 7 days " do
    visit "/"

    click_link "My Lounge"

    expect(page).to have_link(@peter.full_name)

    click_link(@peter.full_name)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
    expect(page).to have_css("div#chart")
  end
end
