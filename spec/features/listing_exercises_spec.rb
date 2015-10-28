require "rails_helper"

RSpec.feature "Listing Exercises" do
  before do
    @joy = User.create(email: "Joy@example.com", first_name: "joy",last_name: "doe", password: "password")
    login_as(@joy)

    @e1 = @joy.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: "2015-08-09")
    @e2 = @joy.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: "2015-08-09")
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
end
