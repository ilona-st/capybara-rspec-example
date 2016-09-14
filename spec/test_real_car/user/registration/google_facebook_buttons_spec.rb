describe 'Google Authorization', type: :feature do
  before do
    visit('http://staging.realcar.nyc')
    find(:css, ".menu-item-link.ng-binding").click
    find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click
  end

  context 'Home Page/Create New Account' do
    it 'success sign in' do

      expect(page).to have_button 'create your account', disabled: true
      expect(page).to have_selector :css, '.modal-content'
      expect(page).to have_selector :css, '.sign-in-separator'
      expect(page).to have_selector :css, '.gl'
      expect(page).to have_selector :css, '.fb'
      page.find('.gl').click

      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      expect(page).to have_text ('One account. All of Google. Sign in with your Google Account')
      fill_in 'email', with: 'moonlight667766@gmail.com'
      click_button('Next')
      fill_in 'Passwd', with: 'Qwerty-123'
      click_button('signIn')

      # expect(page).to have_text ('Want to book another car? BOOK IT NOW')


     end
   end
 end
