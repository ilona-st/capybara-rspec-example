describe 'Confirm reservation', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
    visit('http://staging.realcar.nyc/')
  end

 context 'with email that already in use' do
   it 'error email is already in use' do

     page.find("#searchDateFrom").click
     page.find(".next").click
     page.find('.day', :text => "16").click
     page.find("#searchTimeFrom").click
     click_button "Search"
     sleep 3

     page.first(".booking-car__image").click

     fill_in 'delivery', with: '3rd, Tarrytown, NY 10591, USA'
     services = page.all('.service-item')
     services[1].click
     services[2].click
     services[3].click
     services[4].click
     services[5].click
     click_button 'Book Now'
     sleep 1

     fill_in 'firstName', with: 'Killa'
     fill_in 'lastName', with: 'Willa'
     fill_in 'email', with: 'ilonastovba@gmail.com'
     fill_in 'phone', with: '+1488666777'
     find(:css, ".form-checkbox-wrapper.self-center.no-outdents").click
     click_button 'Book now'
     sleep 1

     expect(page).to have_css('.modal-content')
     expect(page).to have_no_css('.wizard-wrapper')
     expect(page).to have_content('Email already in use')
     expect(page).to have_link('terms and conditions')
    end
  end

  context 'with invalid email' do
    it 'display error email is invalid' do

      page.find("#searchDateFrom").click
      page.find(".next").click
      page.find('.day', :text => "16").click
      page.find("#searchTimeFrom").click
      click_button "Search"
      sleep 3

      page.first(".booking-car__image").click

      fill_in 'delivery', with: '3rd, Tarrytown, NY 10591, USA'
      services = page.all('.service-item')
      services[1].click

      click_button 'Book Now'

      fill_in 'firstName', with: 'Killa'
      fill_in 'lastName', with: 'Willa'
      fill_in 'email', with: '+1488666777'
      fill_in 'phone', with: '+1488666777'
      find(:css, ".form-checkbox-wrapper.self-center.no-outdents").click
      sleep 1

      expect(page).to have_css('.modal-content')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_content('Invalid Email')
      expect(page).to have_link('terms and conditions')
      expect(page).to have_button('Book now', disabled: true)
     end
   end

   context 'without click on check box TERMS AND CONDITIONS ' do
     it 'Book now button disabled' do

       page.find("#searchDateFrom").click
       page.find(".next").click
       page.find('.day', :text => "15").click
       page.find("#searchTimeFrom").click
       click_button "Search"
       sleep 3

       page.first(".booking-car__image").click

       fill_in 'delivery', with: '3rd, Tarrytown, NY 10591, USA'
       services = page.all('.service-item')
       services[4].click
       services[5].click
       click_button 'Book Now'
       sleep 3

       fill_in 'firstName', with: 'Killa'
       fill_in 'lastName', with: 'Willa'
       fill_in 'email', with: 'ilona@ksf.com'
       fill_in 'phone', with: '+1488666777'
       sleep 1

       expect(page).to have_css('.modal-content')
       expect(page).to have_no_css('.wizard-wrapper')
       expect(page).to have_link('terms and conditions')
       expect(page).to have_button('Book now', disabled: true)

      end
    end

    context 'with email that already in use' do
      it 'display error email is already in use' do

        page.find("#searchDateFrom").click
        page.find(".next").click
        page.find('.day', :text => "12").click
        page.find("#searchTimeFrom").click
        click_button "Search"
        sleep 3

        page.first(".booking-car__image").click

        fill_in 'delivery', with: '3rd, Tarrytown, NY 10591, USA'
        services = page.all('.service-item')
        services[3].click
        services[4].click
        services[5].click
        click_button 'Book Now'
        sleep 2


        fill_in 'firstName', with: 'Killa'
        fill_in 'lastName', with: 'Willa'
        fill_in 'email', with: 'ilonastovba@gmail.com'
        fill_in 'phone', with: '+1488666777'
        find(:css, ".form-checkbox-wrapper.self-center.no-outdents").click
        click_button 'Book now'
        sleep 1

        expect(page).to have_css('.modal-content')
        expect(page).to have_no_css('.wizard-wrapper')
        expect(page).to have_content('Email already in use')
        expect(page).to have_link('terms and conditions')
       end
     end

   context 'with emty information in confirm reservation' do
     it 'Book now button disabled validation display erorrs' do

       page.find("#searchDateFrom").click
       page.find(".next").click
       page.find('.day', :text => "16").click
       page.find("#searchTimeFrom").click
       click_button "Search"
       sleep 3

       page.first(".booking-car__image").click

       fill_in 'delivery', with: '3rd, Tarrytown, NY 10591, USA'
       services = page.all('.service-item')
       services[1].click
       click_button 'Book Now'
       sleep 2


       fill_in 'firstName', with: 'Killa'
       fill_in 'lastName', with: 'Willa'
       fill_in 'email', with: 'iloan@dsfdsf.codf'
       fill_in 'phone', with: '+1488666777'
       fill_in 'firstName', with: ''
       fill_in 'lastName', with: ''
       fill_in 'email', with: ''
       fill_in 'phone', with: ''
       find(:css, ".form-checkbox-wrapper.self-center.no-outdents").click
       sleep 1

       expect(page).to have_css('.modal-content')
       expect(page).to have_no_css('.wizard-wrapper')

       expect(page).to have_content('First name is required')
       expect(page).to have_content('Last name is required')
       expect(page).to have_content('Email is required')
       expect(page).to have_content('Phone is required')

       expect(page).to have_link('terms and conditions')
       expect(page).to have_button('Book now', disabled: true)
      end
    end
  end
