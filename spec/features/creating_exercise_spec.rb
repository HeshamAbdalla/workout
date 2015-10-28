require "rails_helper"

RSpec.feature "Creating Exercise" do

  before do
    @joy = User.create(email: "joy@example.com", password: "password")
    login_as(@joy)
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight lifting"
    fill_in "Activity date", with: "2015-6-22"

    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")

    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@joy, exercise))
  end
  scenario "with invalid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_content("Back")

    fill_in "Duration", with: nil
    fill_in "Workout Details", with: ""
    fill_in "Activity date", with: ""
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout can't be blank")
  end
end
