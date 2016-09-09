describe 'Clients Validation', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end
  it "with all empty fields" do
    visit('http://admin.staging.realcar.nyc/clients/list')
    click_button("New Client")
    click_button("Save")
    expect(page).to have_text("First Name is required.")
    expect(page).to have_text("Last Name is required.")
    expect(page).to have_text("Phone is required.")
    expect(page).to have_text("Email is required.")
  end
end
