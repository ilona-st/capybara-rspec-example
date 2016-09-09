describe 'Home Page', type: :feature do
  context 'click on logo' do
    it 'home page is opened' do
      visit('https://staging.realcar.nyc/fleet')
      page.driver.browser.manage.window.resize_to(1500,1500)
      find(".logo-image").click
      expect(page).to have_content('GO FOR A DRIVE Rent a premium car in New York City')
      url = URI.parse(current_url).to_s
      expect(url).to eq('https://staging.realcar.nyc/')
    end
  end

  context 'click on Home button' do
    it 'home page is opened' do
      visit('http://staging.realcar.nyc/fleet')
      click_on ('Home')
      expect(page).to have_content('GO FOR A DRIVE Rent a premium car in New York City')
      url = URI.parse(current_url).to_s
      expect(url).to eq('https://staging.realcar.nyc/')
    end
  end
  context 'click on Book Now button after "Go for a ride" text' do
    it 'if dates doesnt select red validation is displayed' do
      visit('https://staging.realcar.nyc')
      find(:xpath, "//a[@href='/fleet' and @class='btn-link js-show-pickers']").click
      expect(page).to have_css('div.picker-time.error')
      expect(page).to have_css('div.picker-date.error')
      end
    end

  context 'click on Book Now button at the bottom after "Drive real Car.." text' do
    it 'if dates doesnt select red validation is displayed' do
      visit('https://staging.realcar.nyc')
      find(:xpath, "//a[@href='/fleet' and @class='btn-link white static js-show-pickers']").click
      expect(page).to have_css('div.picker-time.error')
      expect(page).to have_css('div.picker-date.error')
    end
  end

  context 'text on home page' do
    it 'text is present' do
       visit('https://staging.realcar.nyc')
       page.driver.browser.manage.window.resize_to(1500,1500)

       expect(page).to have_content ('GO FOR A DRIVE Rent a premium car in New York City')

       expect(page).to have_content ('NEED A REAL CAR?
        Pick your dates and select the Real Car that is right for you.
        DOOR-TO-DOOR DELIVERY
        Have your car delivered to you by a courteous professional.
        ENJOY THE DRIVE
        Drive away in a quality, stylish vehicle — diligently maintained and detailed.
        BOOK NOW
        Real Car offers competitive rates for short and long-term rentals.')

        expect(page).to have_content ('RENT WITH REAL CAR

        A Quality Car.
        A Competitive Price.
        Select one of Real Car’s premium vehicles: Drive in comfort. Show up in style.')

        expect(page).to have_content ('DOOR-TO-DOOR

        Stress-Free Delivery
        No more waiting in lines or rushing to get back to the garage on time. Real Car drops off and picks up your vehicle where you are, on your schedule.')

        expect(page).to have_content ('GUARANTEED QUALITY

        Your Life. Your Car.
        Your Real Car arrives in pristine condition every time—just how you want your own car to be.')

        expect(page).to have_content ('Drive a Real Car')

        expect(page).to have_content ('CONTACT INFO
        HELLO@REALCAR.NYC
        +1 (781) 626-1186')
      end
   end
end
