describe 'Create new account ', type: :feature do
  before  do
    visit('http://staging.realcar.nyc')
    page.driver.browser.manage.window.resize_to(1500,1500)
    find(:css, ".menu-item-link.ng-binding").click
    find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click
  end

  after do
    expect(page).to have_css(".input-wrapper.glyphicon-phone", :text => "Phone number is invalid")
    expect(page).to have_button('create your account', disabled: true)
    expect(page).to have_no_css('.wizard-wrapper')
    expect(page).to have_css ('.modal-content')
  end

 context 'with phone contains symbols' do
   it 'displayed error Phone number is invalid' do
     fill_client_form(userPhone: '380_43234_342')
  end
end

  context 'with phone contains letters' do
    it 'displayed error Phone number is invalid' do
      fill_client_form(userPhone:'38O8997O899oO')
   end
end

  context 'with phone contains symbols and letters' do
    it 'displayed error Phone number is invalid' do
      fill_client_form(userPhone:'re@tr.t$eVB*Hhjk')
   end
  end

  context 'with phone contains numbers and letters' do
    it 'displayed error Phone number is invalid' do
      fill_client_form(userPhone:'re45678Hhjk')
   end
  end

  context 'with phone contains numbers and not permissible symbols' do
    it 'displayed error Phone number is invalid' do
      fill_client_form(userPhone:'2#345&89$56789*')
   end
  end
end

#correct value
describe 'Create new account ', type: :feature do

  before  do
    visit('http://staging.realcar.nyc')
    page.driver.browser.manage.window.resize_to(1500,1500)
    find(:css, ".menu-item-link.ng-binding").click
    find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click
  end

  after do
    expect(page).to have_no_css(".input-wrapper.glyphicon-phone", :text => "Phone number is invalid")
    expect(page).to have_button('create your account', disabled: false)
    expect(page).to have_no_css('.wizard-wrapper')
    expect(page).to have_css ('.modal-content')
  end

   context 'with phone contains only numbers' do
     it 'no error message and "create your account" button is active' do
       fill_client_form(userPhone: '380991310149')
    end
  end

  context 'with phone contains numbers and acceptable symbols' do
    it 'no error message and "create your account" button is active' do
      fill_client_form(userPhone: '+38(099)131-01-49')
   end
 end
end

def fill_client_form options = {}
  default_values = {
    firstName: 'Test',
    lastName: 'Test',
    userEmail: 'tdt@tesadst.cdm',
    userPhone: '380987567888',
    password: '1234567890',
    passConfirm: '1234567890'
  }

  default_values.merge(options).each do |k, v|
    page.find_field(k).set(v)
  end
end
