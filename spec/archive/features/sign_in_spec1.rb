
#for start
#go to this project: /P/capybara-rspec-example
#print: bundle exec rspec spec/features/create_order.rb


describe 'sign in process', type: :feature do
  it 'sign in' do
    visit('http://staging.realcar.nyc/')
    fill_in "searchDateFrom", with: ""
    fill_in 'searchDateFrom', with: '10/20/2016'
    #sleep 3
    fill_in 'searchTimeFrom', with: ""
    fill_in 'searchTimeFrom', with: '12:25 AM'
    #sleep 5
    fill_in "searchDateUntil", with: ""
    fill_in 'searchDateUntil', with: '10/23/2016'
    #sleep 5
    fill_in 'searchTimeUntil', with: ""
    fill_in 'searchTimeUntil', with: '12:25 AM'
    #sleep 5
    click_button "Search"


    page.first(".booking-car__image").click

    fill_in 'delivery', with: 'Baker Street 221B'

    click_button 'Book Now'

    fill_in 'firstName', with: 'Ilona'
    fill_in 'lastName', with: 'Stovba'
    fill_in 'phone', with: '232435353232'
    fill_in 'email', with: 'iii@gmail.com'

#sleep 30
    click_button 'Book now'
    sleep 30
    #find('.submit-order.submit-confirmation').click


  end
end
