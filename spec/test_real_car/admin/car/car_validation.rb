describe 'Cars Validation', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end
   it "with all empty fields" do
    # login
    # sleep 2
    visit('http://admin.staging.realcar.nyc/cars/list')
    click_button('New Car')
    page.find('div[name=brand]').click
    page.find("input[placeholder='Enter a Brand *']").set('')
    page.find('div[name=year]').click
    page.find('div[name=year]').click
    fill_in 'Name *', with: ''
    fill_in 'Model *', with: ''
    fill_in'Colour *', with:''
    fill_in 'Plate #', with: ''
    fill_in 'Location *', with: ''
    fill_in 'Status *', with:''
    fill_in 'VIN' , with: ''
    fill_in 'EZ PASS', with: ''
    fill_in 'SEO Name *', with: ''
    fill_in 'Description', with: ''

    expect(page).to have_button('Save', disabled: true)
    expect(page).to have_text ('Name is required.')
    expect(page).to have_text ('Brand is required.')
    expect(page).to have_text ('Year is required.')
    expect(page).to have_text ('Model is required.')
    expect(page).to have_text ('Location is required.')
    expect(page).to have_text ('Status is required.')
    expect(page).to have_text ('Colour is required.')
    expect(page).to have_text ('SEO Name is required')
   end

 it 'with invalid seo field' do
   visit('http://admin.staging.realcar.nyc/cars/list')
   click_button('New Car')
   fill_in 'SEO Name *', with:'cadi laki'
   fill_in 'EZ PASS', with: 'test'
   expect(page).to have_button('Save', disabled: true)
   expect(page).to have_content ('SEO Name is invalid')
end
it 'with seo that alredy in use' do
  visit('http://admin.staging.realcar.nyc/cars/list')
  click_button('New Car')
  page.find('div[name=brand]').click
  page.find("input[placeholder='Enter a Brand *']").set('NEW Range Rover')
  page.find('div[name=year]').click
  find('.ui-select-choices-row-inner', :text => '2015').click
  fill_in 'Name *', with: 'NEW Range Rover Sport'
  fill_in 'Model *', with: 'NEW Sport'
  fill_in'Colour *', with:'Exterior Silver Interior Silver'
  fill_in 'Plate #', with: '2564457'
  fill_in 'Location *', with: 'NYC'
  fill_in 'Status *', with:'NEW Status'
  fill_in 'VIN' , with: '07564665403'
  fill_in 'EZ PASS', with: 'SGKLL892D'
  fill_in 'SEO Name *', with: 'cadi-laki'
  fill_in 'Description', with: 'NEW'
  click_button('Save')
  sleep 1
  expect(page).to have_content ('Seo name has already been taken')
  click_button("OK")
  expect(page).to have_css ('.modal-content')
 end
end

#
# def fill_car_form options = {}
#   default_values = {
#     Name: 'Test',
#     Model: 'Test',
#     Colour: 'qwerty@test.cdm',
#     'Plate #': '380987567888',
#     Location: '0987654321',
#     Status: '0987654321',
#     VIN: '0987654321',
#     'EZ PASS': '0987654321',
#     'SEO Name': '0987654321',
#     Description: '0987654321'
#   }
#
#   default_values.merge(options).each do |k, v|
#     page.find_field(k).set(v)
#   end
# end
