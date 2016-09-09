describe 'Additional Services Validation', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end
  it "with all empty fields" do
    visit('http://admin.staging.realcar.nyc/services/list')
    click_button("New Addition Service")
    click_button("Save")
    expect(page).to have_text("Service title is required.")
    expect(page).to have_text("Service price is required.")
    expect(page).to have_text("Short name of service is required.")
    expect(page).to have_text("Service position is required.")
  end
end
