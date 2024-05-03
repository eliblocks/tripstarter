describe "Signup" do
  it "creates a user" do
    visit new_user_registration_path

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "trip_pass"
    fill_in "Password confirmation", with: "trip_pass"
    click_button "Sign up"

    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Sign out")
  end
end
