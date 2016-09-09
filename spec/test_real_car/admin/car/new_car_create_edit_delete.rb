describe 'Cars', type: :feature do
   it 'create/edit/delete new car' do
    page.driver.browser.manage.window.maximize
    visit('http://admin.staging.realcar.nyc/')
    page.find_field('email').set('admin@realcar.com')
    page.find_field('password').set('123123123')
    click_button('Login')
    sleep 2

    click_link('Cars')
    sleep 2
    click_button('New Car')
    page.find('div[name=brand]').click
    page.find("input[placeholder='Enter a Brand']").set('Honey Bunny')

    page.find('div[name=year]').click
    find('.ui-select-choices-row-inner', :text => '2016').click

    fill_in 'Name', with: 'Honey Bunny1'
    fill_in 'Model', with: 'Honey Bunny2'
    fill_in'Colour', with:'Honey Bunny3'
    fill_in 'Plate #', with: 'Honey Bunny4'
    fill_in 'Location', with: 'Honey Bunny5'
    fill_in 'Status', with:'Honey Bunny6'
    fill_in 'VIN' , with: 'Honey Bunny7'
    fill_in 'EZ PASS', with: 'Honey Bunny8'
    fill_in 'SEO Name', with: 'HoyB'
    fill_in 'Description', with: 'Honey Bunny9'

    expect(page).to have_no_content ('Name is required.')
    expect(page).to have_no_content ('Model is required.')
    expect(page).to have_no_content ('Location is required.')
    expect(page).to have_no_content ('Status is required.')
    expect(page).to have_no_content ('Colour is required.')
    click_button('Save')

    expect(page).to have_content ('Honey Bunny1')

    click_link('Cars')
    click_link('Honey Bunny1')
    page.find('div[car-form="carId"]').click

    page.find('div[name=brand]').click
    page.find("input[placeholder='Enter a Brand']").set('Honey Bunny')

    page.find('div[name=year]').click
    find('.ui-select-choices-row-inner', :text => '2015').click

    fill_in 'Name', with: 'Lolly Pop'
    fill_in 'Model', with: 'Lolly Pop1'
    fill_in'Colour', with:'Lolly Pop2'
    fill_in 'Plate #', with: 'Lolly Pop3'
    fill_in 'Location', with: 'Lolly Pop4'
    fill_in 'Status', with:'Lolly Pop5'
    fill_in 'VIN' , with: 'Lolly Pop6'
    fill_in 'EZ PASS', with: 'Lolly Pop7'
    fill_in 'SEO Name', with: 'Lolly'
    fill_in 'Description', with: 'Lolly Pop8'

    expect(page).to have_no_content ('Name is required.')
    expect(page).to have_no_content ('Model is required.')
    expect(page).to have_no_content ('Location is required.')
    expect(page).to have_no_content ('Status is required.')
    expect(page).to have_no_content ('Colour is required.')
    click_button('Save')

    click_link('Cars')
    click_link('Lolly Pop')
    page.find('div[car-form="carId"]').click
    click_button('Delete')
    sleep 2


     click_button('Yes, delete it!')
     sleep 1
     click_button('OK')

     click_link('Cars')
     expect(page).to have_no_content ('Lolly Pop')
  end
end
