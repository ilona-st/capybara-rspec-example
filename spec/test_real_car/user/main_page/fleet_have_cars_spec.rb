describe 'Fleet', type: :feature do
  context 'click on Viev Our Fleet button' do
    it 'Fleet page is opened and it shows cars' do
       visit('https://staging.realcar.nyc')
       page.driver.browser.manage.window.resize_to(1500,1500)
       click_on('view our fleet')
       cars = page.all('a.booking__car.booking-car__root')

       expect(cars.size).to eq 20
       #expect(page).to have_current_path('/fleet')
       url = URI.parse(current_url).to_s
       expect(url).to eq('https://staging.realcar.nyc/fleet')

      end
   end

   context 'Click on Fleet button' do
     it 'Fleet page is opened and it shows cars' do
        visit('https://staging.realcar.nyc')
        page.driver.browser.manage.window.resize_to(1500,1500)
        click_on('Fleet')
        cars = page.all('a.booking__car.booking-car__root')

        expect(cars.size).to eq 20
        #expect(page).to have_current_path('/fleet')
        url = URI.parse(current_url).to_s
        expect(url).to eq('https://staging.realcar.nyc/fleet')

       end
    end
end






# def check_element parent, class_name, content = nil
#   el = parent.find(class_name)
#   expect(el).not_to be_nil
#   expect(el).to have_content(content) if content
# end
#
# def check_car car
#   check_element(car, '.booking-car-info__color', 'Exterior White Interior Black')
#   check_element(car, '.book-now', 'BOOK NOW')
#   check_element(car, '.booking-car-info__name', 'Porsche Cayenne')
#   check_element(car, '.booking-car-info__price')
#   check_element(car, '.count', '149')
#   check_element(car, '.duration', 'per day')
# end
#
# def check_car_with_special_price car
#   check_element(car, '.booking-car-info__color', 'Exterior White Interior Black')
#   check_element(car, '.book-now', 'BOOK NOW')
#   check_element(car, '.booking-car-info__name', 'Porsche Cayenne')
#   check_element(car, '.booking-car-info__price')
#   check_element(car, '.count', '249')
#   check_element(car, '.duration', 'today')
# end
