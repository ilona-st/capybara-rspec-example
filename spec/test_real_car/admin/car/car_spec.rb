describe 'Cars', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end
context 'Create/Edit/Delete' do
  it 'create car' do
    visit('https://admin.staging.realcar.nyc/cars/list')
    sleep 2
    click_button('New Car')

    page.find('div[name=brand]').click
    page.find("input[placeholder='Enter a Brand *']").set('Range Rover')
    page.find('div[name=year]').click
    find('.ui-select-choices-row-inner', :text => '2011').click

    fill_in 'Name *', with: 'Range6'
    fill_in 'Model *', with: 'Sport'
    fill_in'Colour *', with:'Exterior Black Interior Black'
    fill_in 'Plate #', with: '2TD547'
    fill_in 'Location *', with: 'NY'
    fill_in 'Status *', with:'Status'
    fill_in 'VIN' , with: '00811313803'
    fill_in 'EZ PASS', with: 'SALSK2D'
    fill_in 'SEO Name *', with: 'RRS-Black_Test5'
    fill_in 'Description', with: 'Range Rover Sport
Color: Exterior Black Interior Black
4-wheel-drive
Premium leather interior
Heated seats and steering wheel
Power sunroof
Harman/Kardon premium sound system
Voice-activated navigation system
Bluetooth wireless data link
Auxiliary cable & iPhone charger included
Seats five'

    expect(page).to have_no_content ('Name is required.')
    expect(page).to have_no_content ('Brand is required.')
    expect(page).to have_no_content ('Year is required.')
    expect(page).to have_no_content ('Model is required.')
    expect(page).to have_no_content ('Location is required.')
    expect(page).to have_no_content ('Status is required.')
    expect(page).to have_no_content ('Colour is required.')
    expect(page).to have_no_content ('SEO Name is required')

    click_button('Save')
    sleep 3
    expect(page).to have_content ("Name: Range6 Range Rover Sport Exterior Black Interior Black 2011 NY Status VIN: 00811313803 EZ PASS: SALSK2D Range Rover Sport Color: Exterior Black Interior Black 4-wheel-drive Premium leather interior Heated seats and steering wheel Power sunroof Harman/Kardon premium sound system Voice-activated navigation system Bluetooth wireless data link Auxiliary cable & iPhone charger included Seats five")
  end

it 'edit car' do
  visit('http://admin.staging.realcar.nyc/cars/list')

  click_link("Range6")
  page.find('div[car-form="carId"]').click

   page.find('div[name=brand]').click
   page.find("input[placeholder='Enter a Brand *']").set('NEW Range Rover')
   page.find('div[name=year]').click
   find('.ui-select-choices-row-inner', :text => '2015').click

   fill_in 'Name *', with: 'NEW Range Rover Sport'
   fill_in 'Model *', with: 'NEW Sport'
   fill_in'Colour *', with:'Exterior Silver Interior Silver'
   fill_in 'Plate #', with: '2564457'
   fill_in 'Location *', with: 'NYC'
   fill_in 'Status *', with:'NEW Status'
   fill_in 'VIN' , with: '07564665403'
   fill_in 'EZ PASS', with: 'SGKLL892D'
   fill_in 'SEO Name *', with: 'RRS-Silver_Test666'
   fill_in 'Description', with: 'NEW Range Rover Sport
Color: Exterior Silver Interior Black
4-wheel-drive
Premium leather interior
Heated seats and steering wheel
Harman/Kardon premium sound system
Voice-activated navigation system
Bluetooth wireless data link
Auxiliary cable & iPhone charger included
Seats five'

    expect(page).to have_no_content ('Name is required.')
    expect(page).to have_no_content ('Brand is required.')
    expect(page).to have_no_content ('Year is required.')
    expect(page).to have_no_content ('Model is required.')
    expect(page).to have_no_content ('Location is required.')
    expect(page).to have_no_content ('Status is required.')
    expect(page).to have_no_content ('Colour is required.')
    expect(page).to have_no_content ('SEO Name is required')
   click_button('Save')

   sleep 3
   expect(page).to have_content ("Name: NEW Range Rover Sport NEW Range Rover NEW Sport Exterior Silver Interior Silver 2015 NYC NEW Status VIN: 07564665403 EZ PASS: SGKLL892D NEW Range Rover Sport Color: Exterior Silver Interior Black 4-wheel-drive Premium leather interior Heated seats and steering wheel Harman/Kardon premium sound system Voice-activated navigation system Bluetooth wireless data link Auxiliary cable & iPhone charger included Seats five")

 end

  it 'delete car' do
    visit('http://admin.staging.realcar.nyc/cars/list')
    click_link('NEW Range Rover Sport')
    expect(page).to have_content ("Name: NEW Range Rover Sport NEW Range Rover NEW Sport Exterior Silver Interior Silver 2015 NYC NEW Status VIN: 07564665403 EZ PASS: SGKLL892D NEW Range Rover Sport Color: Exterior Silver Interior Black 4-wheel-drive Premium leather interior Heated seats and steering wheel Harman/Kardon premium sound system Voice-activated navigation system Bluetooth wireless data link Auxiliary cable & iPhone charger included Seats five")
    page.find('div[car-form="carId"]').click
    click_button('Delete')
    sleep 2

    click_button('Yes, delete it!')
    sleep 1
    click_button('OK')
    click_link('Cars')
    expect(page).to have_no_content ('NEW Range Rover Sport')
  end
end
  context 'Validation'do
    it "with all empty fields" do
     # login
     # sleep 2
     visit('http://admin.staging.realcar.nyc/cars/list')
     click_button('New Car')
     page.find('div[name=brand]').click
     page.find("input[placeholder='Enter a Brand *']").set('')
     page.find('div[name=year]').click
     page.find('div[name=year]').click
     fill_in 'Name *', with: ''
     fill_in 'Model *', with: ''
     fill_in'Colour *', with:''
     fill_in 'Plate #', with: ''
     fill_in 'Location *', with: ''
     fill_in 'Status *', with:''
     fill_in 'VIN' , with: ''
     fill_in 'EZ PASS', with: ''
     fill_in 'SEO Name *', with: ''
     fill_in 'Description', with: ''

     expect(page).to have_button('Save', disabled: true)
     expect(page).to have_text ('Name is required.')
     expect(page).to have_text ('Brand is required.')
     expect(page).to have_text ('Year is required.')
     expect(page).to have_text ('Model is required.')
     expect(page).to have_text ('Location is required.')
     expect(page).to have_text ('Status is required.')
     expect(page).to have_text ('Colour is required.')
     expect(page).to have_text ('SEO Name is required')
  end

    it 'with invalid seo field' do
      visit('http://admin.staging.realcar.nyc/cars/list')
      click_button('New Car')
      fill_in 'SEO Name *', with:'cadi laki'
      fill_in 'EZ PASS', with: 'test'
      expect(page).to have_button('Save', disabled: true)
      expect(page).to have_content ('SEO Name is invalid')
    end
    it 'with seo that alredy in use' do
      visit('http://admin.staging.realcar.nyc/cars/list')
      click_button('New Car')
      page.find('div[name=brand]').click
      page.find("input[placeholder='Enter a Brand *']").set('NEW Range Rover')
      page.find('div[name=year]').click
      find('.ui-select-choices-row-inner', :text => '2015').click
      fill_in 'Name *', with: 'NEW Range Rover Sport'
      fill_in 'Model *', with: 'NEW Sport'
      fill_in'Colour *', with:'Exterior Silver Interior Silver'
      fill_in 'Plate #', with: '2564457'
      fill_in 'Location *', with: 'NYC'
      fill_in 'Status *', with:'NEW Status'
      fill_in 'VIN' , with: '07564665403'
      fill_in 'EZ PASS', with: 'SGKLL892D'
      fill_in 'SEO Name *', with: 'cadi-laki'
      fill_in 'Description', with: 'NEW'
      click_button('Save')
      sleep 1
      expect(page).to have_content ('Seo name has already been taken')
      click_button("OK")
      expect(page).to have_css ('.modal-content')
    end
  end
end
