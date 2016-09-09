describe 'Create Order', type: :feature do
  context 'Text' do
    it 'clicks through calendar and so on..' do
      page.driver.browser.manage.window.resize_to(1500,1500)
      visit('http://staging.realcar.nyc/fleet')
      cars = page.all('a.booking__car.booking-car__root')
      cars[1].click
      page.find('input[name="dateFrom"]').click
      page.find('.day[data-day="05/31/2016"]').click

      page.find('input[name="timeFrom"]').click
      #page.find('.timepicker-hour').click
      page.find('.timepicker-hour[data-action="showHours"]').click


      # click_on ('Decrement Hour')
      # click_on ('Decrement Minute')
      # click_on ('Increment Hour')
      # click_on ('Increment Minute')
      # click_on ('Toggle Period')
      # page.find('.set-time-button').click
      sleep 10


      #page.find('.hour[data-action="showHours"]').click


      #sleep 10

    end
  end
end
