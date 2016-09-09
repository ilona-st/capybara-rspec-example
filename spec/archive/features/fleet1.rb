describe 'basic create order', type: :feature do
  it 'sign in' do
    visit('http://staging.realcar.nyc/')
    click_link "Fleet"
    #car = page.all('.booking-car__image')
    #car[4].click
    page.first(".booking-car__image").click

    fill_in 'delivery', with: 'Baker Street 221B'

    click_button 'Book Now'

    #fill_in 'dateFrom', with: ""
    fill_in 'dateFrom', with: '05/18/2016'
    sleep 3
    #fill_in 'searchTimeFrom', with: ""
    fill_in 'timeFrom', with: '5:25 PM'
    sleep 5
    fill_in "searchDateUntil", with: ""
    fill_in 'dateUntil', with: '05/20/2016'
    #sleep 5
    #fill_in 'searchTimeUntil', with: ""
    fill_in 'timeUntil', with: '12:25 AM'
    #sleep 5
    click_button "Search"

    fill_in 'firstName', with: 'Ilona'
    fill_in 'lastName', with: 'Stovba'
    fill_in 'phone', with: '232435353232'
    fill_in 'email', with: 'iii@gmail.com'

#sleep 30
    click_button 'Book now'
    sleep 30


  end
end
