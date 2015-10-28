require "rails_helper"

RSpec.feature "Deleting Exercise" do
  before do
    @owner = User.create(email: "owner@example.com", first_name: "joy", last_name: "doe", password: "password")
    @owner_exer = @owner.exercises.create!(duration_in_min: 46, workout: "Lifting", workout_date: "2015-6-22")
    login_as(@owner)
  end

  scenario do
    visit "/"
    click_link "My Lounge"
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Destroy']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end
end
