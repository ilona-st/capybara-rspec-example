describe 'Already have an account? SIGN IN TO YOUR ACCOUNT', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
    # visit('http://staging.realcar.nyc/')
  end

 context 'with existing email and correct password and with checkbox on agreement' do
   it 'display dashboard' do

    #  page.find("#searchDateFrom").click
    #  page.find(".next").click
    #  page.find('.day', :text => "16").click
    #  page.find("#searchTimeFrom").click
     #
    #  click_button "Search"
    #  page.first(".booking-car__image").click
     #
    #  fill_in 'delivery', with: '3rd, Tarrytown, NY 10591, USA'
    #  services = page.all('.service-item')
    #  services[1].click
    #  services[5].click

    visit('http://staging.realcar.nyc/fleet/cadi-laki/#/from/2016-11-23T13:28/until/2016-11-24T13:28')
    fill_in 'delivery', with: '3rd, Tarrytown, NY 10591, USA'


     click_button 'Book Now'
     sleep 2
     find('#accountTitles', :text => 'SIGN IN TO YOUR ACCOUNT').click
     sleep 2
    #  fill_in "email", with: "ilonastovba@gmail.com"
    #  fill_in "pass", with: "1234567890"

     checkbox
     
     sleep 5

    expect(page).to have_button('Book now', disabled: true)

sleep 5

    #  click_button 'Book now'
    #  expect(page).to have_css('.modal-content')
    #  expect(page).to have_no_css('.wizard-wrapper')
    #  expect(page).to have_content('Email already in use')
    #  expect(page).to have_link('terms and conditions')
        end
     end
  end
