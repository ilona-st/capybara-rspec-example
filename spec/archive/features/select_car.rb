describe 'basic create order', type: :feature do
  it 'sign in' do
    visit('http://staging.realcar.nyc/')

    fill_in "searchDateFrom", with: ""
    fill_in 'searchDateFrom', with: '05/18/2016'

    sleep 5
    fill_in "searchDateUntil", with: ""
    fill_in 'searchDateUntil', with: '05/20/2016'

    sleep 5
    click_button "Search"



    car = page.all('.booking-car__image')
    car[4].click

    #page.first(".booking-car__image").click



    fill_in 'delivery', with: 'Baker Street 221B'

    #sleep(5)

    services = page.all('.service-item')
    services[1].click
    services[3].click
    services[3].click

    #sleep(5)

    click_button 'Book Now'

    fill_in 'firstName', with: 'Il'
    fill_in 'lastName', with: 'St'
    fill_in 'phone', with: '232435353232'
    fill_in 'email', with: 'jane_air16@ukr.net'

    click_button 'Book now'
    sleep (10)



  end
end
