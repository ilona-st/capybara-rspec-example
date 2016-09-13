describe 'Clients', type: :feature do
    before  do
      page.driver.browser.manage.window.maximize
    end

  context 'Create/Edit/Delete' do
    it 'create and delete new client with only required fields' do
      # login
      # sleep 1
     visit('http://admin.staging.realcar.nyc/')
     find('#side-menu').first(:link, "Clients").click
     click_button 'New Client'

     fill_in 'First name', with: 'Leo'
     fill_in 'Last name', with: 'Vinci'
     fill_in 'Phone', with: '+355432982'
     fill_in 'Email', with: 'leo1452@gmaatrail.com'

     click_button 'Create'
     sleep 2
     expect(page).to have_text("Full Name: Leo Vinci UNVERIFIED Email: leo1452@gmaatrail.com Phone: +355432982 Group: Regular Clients")
     page.find('div[client="client"]').click
     sleep 1
     click_button 'Delete'
     sleep 1
     click_button 'Yes, delete it!'
     click_button 'OK'
     expect(page).to have_no_text("Full Name: Leo Vinci UNVERIFIED Email: leo1452@gmaatrail.com Phone: +355432982 Group: Regular Clients")
   end

   it 'create new client with all fields' do
    visit('http://admin.staging.realcar.nyc/')
    find('#side-menu').first(:link, "Clients").click
    click_button 'New Client'

    fill_in 'First name', with: 'Leonardo'
    fill_in 'Last name', with: 'da Vinci'
    fill_in 'Phone', with: '+35543298231'
    fill_in 'Email', with: 'leo1452@gmaaail.com'
    fill_in 'Notes', with: 'Leonardo di ser Piero da Vinci, more commonly Leonardo da Vinci or simply Leonardo..'
    fill_in 'Country', with: 'Republic of Florence'
    fill_in 'State', with: 'Italy'
    fill_in 'Home address', with: 'the lower valley of the Arno river'
    fill_in 'City', with: 'Florence'
    fill_in 'Zip', with: '42323432'
    fill_in 'Employer', with: 'King'
    fill_in "Employer's title", with: 'Great'
    fill_in 'How long?', with: 'all day long'
    fill_in "Employer's supervisor", with: 'Madam'
    fill_in "Employer's address", with: 'Venice'
    fill_in "Employer's phone", with: '+1645564556'
    fill_in "Emergency contact", with: '+654434234423'
    fill_in "Emergency address", with: 'the territory of the Medici-ruled Republic of Florence'
    fill_in "Emergency Phone", with: '+4654654564'

    click_button 'Create'
    sleep 2
    expect(page).to have_text("Full Name: Leonardo da Vinci UNVERIFIED Email: leo1452@gmaaail.com Phone: +35543298231 Group: Regular Clients Notes: Leonardo di ser Piero da Vinci, more commonly Leonardo da Vinci or simply Leonardo.. Country: Republic of Florence State: Italy City: Florence Home address: the lower valley of the Arno river Zip: 42323432 Employer: King Employer's title: Great How long? all day long Employer's supervisor: Madam Employer's address: Venice Employer's phone: +1645564556 Emergency contact: +654434234423 Emergency address: the territory of the Medici-ruled Republic of Florence Emergency phone: +4654654564")
  end

  it 'edit client' do
    visit('http://admin.staging.realcar.nyc/clients/list')
    sleep 3
    click_link('Mr. Leonardo da Vinci')
    sleep 2
    page.find('div[client="client"]').click
    fill_in 'First name', with: 'NewLeo'
    fill_in 'Last name', with: 'NewVinci'
    fill_in 'Phone', with: '+9935543298231'
    fill_in 'Email', with: 'leo1452999@gmaail.com'
    fill_in 'Notes', with: 'NEW Leonardo di ser Piero da Vinci, more commonly Leonardo da Vinci or simply Leonardo..'
    fill_in 'Country', with: 'New Republic of Florence'
    fill_in 'State', with: 'France'
    fill_in 'Home address', with: 'the lower valley of the Avonriver'
    fill_in 'City', with: 'Madrid'
    fill_in 'Zip', with: '42876768432'
    fill_in 'Employer', with: 'Qween'
    fill_in "Employer's title", with: 'GreatM'
    fill_in 'How long?', with: 'all night long'
    fill_in "Employer's supervisor", with: 'Prince'
    fill_in "Employer's address", with: 'NewVenice'
    fill_in "Employer's phone", with: '+16488886'
    fill_in "Emergency contact", with: '+6544349999423'
    fill_in "Emergency address", with: 'new Florence'
    fill_in "Emergency Phone", with: '+4650978564'

    click_button("Update")
    sleep 2

    expect(page).to have_text("Full Name: NewLeo NewVinci UNVERIFIED Email: leo1452999@gmaail.com Phone: +9935543298231 Group: Regular Clients Notes: Leonardo di ser Piero da Vinci, more commonly Leonardo da Vinci or simply Leonardo.. Country: New Republic of Florence State: France City: Madrid Home address: the lower valley of the Avonriver Zip: 42876768432 Employer: Qween Employer's title: GreatM How long? all night long Employer's supervisor: Prince Employer's address: NewVenice Employer's phone: +16488886 Emergency contact: +6544349999423 Emergency address: new Florence Emergency phone: +4650978564")
  end

  it 'delete client' do
    visit('http://admin.staging.realcar.nyc/clients/list')
    sleep 2
    click_link('Mr. NewLeo NewVinci')
    sleep 2
    page.find('div[client="client"]').click
    sleep 1
    click_delete
    expect(page).to have_no_text("Full Name: NewLeo NewVinci UNVERIFIED Email: leo1452999@gmaaaaail.com Phone: +9935543298231 Group: Regular Clients Notes:
    NEW Leonardo di ser Piero da Vinci, more commonly Leonardo da Vinci or simply Leonardo..
    Country: New Republic of Florence State: France City: Madrid
    Home address: the lower valley of the Avonriver Zip: 42876768432
    Employer: Qween Employer's title: GreatM How long? all night long
    Employer's supervisor: Prince Employer's address: NewVenice Employer's phone: +16488886
    Emergency contact: +6544349999423 Emergency address: the territory `new Florence Emergency phone: +4650978564")
  end
end

context 'Validation' do
    it "with all empty fields" do
      visit('http://admin.staging.realcar.nyc/clients/list')
      sleep 2
      click_button("New Client")
      click_button("Create")
      click_button("Create")
      sleep 2
      expect(page).to have_content("First Name is required.")
      expect(page).to have_content("Last Name is required.")
      expect(page).to have_content("Phone is required.")
      expect(page).to have_content("Email is required.")
    end
  end
end
