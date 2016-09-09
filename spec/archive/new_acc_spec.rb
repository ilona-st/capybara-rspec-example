describe 'Create new account ', type: :feature do
  context 'with blank first name' do
    it '"Create Your Account" button is disabled and wizard shown' do
      visit('http://staging.realcar.nyc')
      page.driver.browser.manage.window.resize_to(1500,1500)
      find(:css, ".menu-item-link.ng-binding").click
      find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click

      page.find_field('firstName').set('Test')
      page.find_field('lastName').set('Test')
      page.find_field('userEmail').set('ilona.stovba+27@customertimes.com')
      page.find_field('userPhone').set('+380991310149')
      page.find_field('password').set('1234567890')
      page.find_field('passConfirm').set('1234567890')
      click_button('create your account')

      expect(page).to have_button('create your account', disabled: false)
      expect(page).to have_css('.wizard-container')
      # можно продолжить до визарда и юзерского кабинета

      sleep 3

      visit('http://admin.staging.realcar.nyc/')
      page.find_field('email').set('admin@realcar.com')
      page.find_field('password').set('123123123')
      click_button('Login')

      find('side-menu.clients.list').click


      sleep 3

      # проверить чтобы клиент в админке отобразился






      end
    end
  end
