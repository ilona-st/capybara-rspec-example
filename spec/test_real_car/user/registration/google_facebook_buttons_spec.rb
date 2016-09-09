describe 'Create new account ', type: :feature do
  before do
    visit('http://staging.realcar.nyc')
    page.driver.browser.manage.window.resize_to(1500,1500)
    find(:css, ".menu-item-link.ng-binding").click
    find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click
  end
  context 'google authorization' do
    it 'active button display on page' do

      expect(page).to have_button 'create your account', disabled: true
      expect(page).to have_selector :css, '.modal-content'
      expect(page).to have_selector :css, '.sign-in-separator'

     end
   end
 end
