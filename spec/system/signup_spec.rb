describe "Signup" do
  it "creates a user" do
    visit new_user_registration_path

    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "trip_pass"
    click_button "Sign up"

    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Sign out")
  end
end
