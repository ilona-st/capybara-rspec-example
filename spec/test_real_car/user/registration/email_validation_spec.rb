describe 'Create new account ', type: :feature do
  before do
    visit('http://staging.realcar.nyc')
    page.driver.browser.manage.window.resize_to(1500,1500)
    find(:css, ".menu-item-link.ng-binding").click
    find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click
  end

  context 'with blank email' do
    it 'displayed error Email is required' do
      fill_client_form(userEmail: '')


      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('Email is required')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
     end
   end

   context 'with email that contains only numbers' do
     it 'displayed error "Invalid email"' do
       fill_client_form(userEmail: '11111')


       expect(page).to have_button('create your account', disabled: true)
       expect(page).to have_content('Invalid email')
       expect(page).to have_no_content('Email already in use')
       expect(page).to have_no_css('.wizard-wrapper')
       expect(page).to have_css ('.modal-content')
      end
    end

    context 'with email that hasnt @ symbol' do
      it 'displayed error "Invalid email"' do
        fill_client_form(userEmail: 'testtetsts.tehs')

        expect(page).to have_button('create your account', disabled: true)
        expect(page).to have_content('Invalid email')
        expect(page).to have_no_content('Email already in use')
        expect(page).to have_no_css('.wizard-wrapper')
        expect(page).to have_css ('.modal-content')
       end
     end

     context 'with email that has @ symbol as first character' do
       it 'displayed error "Invalid email"' do
         fill_client_form(userEmail: '@testtesut.com')

         expect(page).to have_button('create your account', disabled: true)
         expect(page).to have_content('Invalid email')
         expect(page).to have_no_content('Email already in use')
         expect(page).to have_no_css('.wizard-wrapper')
         expect(page).to have_css ('.modal-content')
        end
      end
    end

    def fill_client_form options = {}
      default_values = {
        firstName: 'Test',
        lastName: 'Test',
        userEmail: 'qwertwy@test.cdm',
        userPhone: '380987567888',
        password: '0987654321',
        passConfirm: '0987654321'
      }

      default_values.merge(options).each do |k, v|
        page.find_field(k).set(v)
      end
    end
