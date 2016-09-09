describe 'Cars Validation', type: :feature do
 context 'with invalid seo' do
     it 'display error and car doesnt create' do
       page.driver.browser.manage.window.maximize
       visit('http://admin.staging.realcar.nyc/')
      #  page.find_field('email').set('admin@realcar.com')
      #  page.find_field('password').set('123123123')
      #  click_button('Login')
       click_link('Cars')
       sleep 2
       click_button('New Car')
       page.find('div[name=brand]').click
       page.find("input[placeholder='Enter a Brand']").set('Honey Bunny')
       page.find('div[name=year]').click
       find('.ui-select-choices-row-inner', :text => '2016').click
       fill_car_form('SEO Name': '1234 567')
       click_button('Save')

       expect(page).to have_content ('SEO Name is invalid')
       expect(page).to have_no_content ('Name is required.')
       expect(page).to have_no_content ('Model is required.')
       expect(page).to have_no_content ('Location is required.')
       expect(page).to have_no_content ('Status is required.')
       expect(page).to have_no_content ('Colour is required.')
       expect(page).to have_no_content ('CAR ID: NAN')
      end
    end

  context 'with seo that alredy in use' do
    it 'display error and car doesnt create' do
      page.driver.browser.manage.window.maximize
      visit('http://admin.staging.realcar.nyc/cars/list')
      page.find('div[name=brand]').click
      page.find("input[placeholder='Enter a Brand']").set('Honey Bunny')
      page.find('div[name=year]').click
      find('.ui-select-choices-row-inner', :text => '2016').click
      fill_car_form('SEO Name': 'cadi-laki')
      click_button('Save')
      sleep 3

      expect(page).to have_content ('Seo name is already in use')
      expect(page).to have_no_content ('Name is required.')
      expect(page).to have_no_content ('Model is required.')
      expect(page).to have_no_content ('Location is required.')
      expect(page).to have_no_content ('Status is required.')
      expect(page).to have_no_content ('Colour is required.')
      expect(page).to have_no_content ('CAR ID: NAN')
     end
   end

   context 'with empty seo' do
     it 'display error and car doesnt create' do

       page.driver.browser.manage.window.maximize
       visit('http://admin.staging.realcar.nyc/cars/list')
       click_button('New Car')
       page.find('div[name=brand]').click
       page.find("input[placeholder='Enter a Brand']").set('Honey Bunny')
       page.find('div[name=year]').click
       find('.ui-select-choices-row-inner', :text => '2016').click
       fill_car_form('SEO Name': '')
       click_button('Save')

       expect(page).to have_content ('SEO Name is required')
       expect(page).to have_no_content ('Name is required.')
       expect(page).to have_no_content ('Model is required.')
       expect(page).to have_no_content ('Location is required.')
       expect(page).to have_no_content ('Status is required.')
       expect(page).to have_no_content ('Colour is required.')
       expect(page).to have_no_content ('CAR ID: NAN')
      end
    end
  end

def fill_car_form options = {}
  default_values = {
    Name: 'Test',
    Model: 'Test',
    Colour: 'qwerty@test.cdm',
    'Plate #': '380987567888',
    Location: '0987654321',
    Status: '0987654321',
    VIN: '0987654321',
    'EZ PASS': '0987654321',
    'SEO Name': '0987654321',
    Description: '0987654321'
  }

  default_values.merge(options).each do |k, v|
    page.find_field(k).set(v)
  end
end
