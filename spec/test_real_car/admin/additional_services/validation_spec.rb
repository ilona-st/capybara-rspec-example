describe 'Additional Services Validation', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
    visit('https://admin.staging.realcar.nyc/')
    page.find_field('email').set('admin@realcar.com')
    page.find_field('password').set('123123123')
    click_button('Login')
    sleep 1
  end

  it "check validation" do
    visit('https://admin.staging.realcar.nyc/services/list')
    sleep 6
    edit = page.find('h3.panel-title')
    edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
    click_button("Save")

    val = ('.additionServiceFormCtrl.isErrorClass')
    expect(val).to have_text("Service title is required.")
  end
end
