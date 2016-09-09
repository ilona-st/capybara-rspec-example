describe 'Create new account ', type: :feature do

  before  do
    visit('http://staging.realcar.nyc')
    page.driver.browser.manage.window.resize_to(1500,1500)
    find(:css, ".menu-item-link.ng-binding").click
    find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click
  end

   context 'with password less than 8 character and with confirm password with more than 8 character' do
     it 'displayed error Password must be more then 8 characters and Passwords do not match' do

      fill_client_form(password: '1234567', passConfirm: '1234567890')
      page.find('.modal-content').click

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
      expect(page).to have_content('Password must be more then 8 characters')
      expect(page).to have_content('Passwords do not match')

      # expect(page).to have_no_css(".input-wrapper.pass", :text => "Password must be more then 8 characters")
    end
  end

  context 'with password less than 8 character and with confirm password with less than 8 character' do
    it 'displayed error Password must be more then 8 characters and Passwords do not match' do

      fill_client_form(password: '12345Nn', passConfirm: '12345Nn')
      page.find('.modal-content').click

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('Password must be more then 8 characters')
      expect(page).to have_content('Password must be more then 8 characters')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
     end
   end

  context 'with password that doesnt match with confirm password' do
    it 'displayed error Passwords do not match' do

      fill_client_form(password: '1234567890Mm', passConfirm: '1234567890Mmm')
      page.find('.modal-content').click

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('Passwords do not match')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
    end
  end

  context 'with blank password and blank confirm password ' do
    it '"create your account" button is disabled' do
      fill_client_form(password: '', passConfirm: '')
      page.find('.modal-content').click

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
    end
  end

  context 'with blank password and with confirm password ' do
    it 'displayed error Passwords do not match' do

      fill_client_form(password: '', passConfirm: '1234567890Mmm')
      page.find('.modal-content').click

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('Passwords do not match')
      expect(page).to have_content('Password is required')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
    end
  end

  context 'with password and confirm password less than 8 characters' do
    it 'displayed error Passwords do not match' do

      fill_client_form(password: '1234567890', passConfirm: '1234567')
      page.find('.modal-content').click

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('Passwords do not match')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
    end
  end

  context 'with password and confirm password less than 8 characters' do
    it 'displayed error Password confirmation is required' do

      fill_client_form(password: '43567898789', passConfirm: '')
      page.find('.modal-content').click

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('Password confirmation is required')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
    end
  end

  context 'with pass and confirm pass that match and than change pass to another' do
    it 'displayed error Passwords do not match' do
      page.find_field('firstName').set('Test')
      page.find_field('lastName').set('Test')
      page.find_field('userEmail').set('tesj9tuder@ds.com')
      page.find_field('password').set('1234567890')
      page.find_field('passConfirm').set('1234567890')
      page.find_field('password').set('MMM1234567890')
      page.find_field('userPhone').set('+380991310149')

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('Passwords do not match')
      expect(page).to have_no_content('Password confirmation is required')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
    end
  end
 end

def fill_client_form options = {}
  default_values = {
    firstName: 'Test',
    lastName: 'Test',
    userEmail: 'qwerty@test.cdm',
    userPhone: '380987567888',
    password: '0987654321',
    passConfirm: '0987654321'
  }

  default_values.merge(options).each do |k, v|
    page.find_field(k).set(v)
  end
end
