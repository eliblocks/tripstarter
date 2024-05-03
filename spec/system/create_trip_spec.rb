RSpec.describe "create a trip" do
  let(:user) { create(:user, password: "trip_pass") }

  it "creates a trip" do
    login_as(user)
    visit root_path
    click_link("New Trip")
    fill_in "Title", with: "Beach"
    fill_in "Origin", with: "Park"
    fill_in "Destination", with: "Beach"
    fill_in "Departing at", with: 1.day.from_now
    click_button "Submit"

    expect(page).to have_content("Beach")
  end
end
