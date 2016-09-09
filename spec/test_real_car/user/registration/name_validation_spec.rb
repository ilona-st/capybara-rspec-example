describe 'Create new account ', type: :feature do
  before do
    visit('http://staging.realcar.nyc')
    page.driver.browser.manage.window.maximize
    find(:css, ".menu-item-link.ng-binding").click
    find(:css, ".monsterr-2.white.text-uppercase.text-right.create-account-label").click
  end

  context 'with blank first name' do
    it 'displayed error "First name is required' do

      fill_client_form(firstName: 'Name', firstName: '')

      expect(page).to have_button('create your account', disabled: true)
      expect(page).to have_content('First name is required')
      expect(page).to have_no_css('.wizard-wrapper')
      expect(page).to have_css ('.modal-content')
      # expect(page).to have_css("p-rel.ng-scope", :text => "First name is required")

      end
    end

   context 'with first name that contains numbers' do
     it 'displayed error "First name is invalid"' do

      fill_client_form(firstName: '1lona')

       expect(page).to have_button('create your account', disabled: true)
       expect(page).to have_content('First name is invalid')
       expect(page).to have_no_css('.wizard-wrapper')
       expect(page).to have_css ('.modal-content')


      end
    end

    context 'with blank last name' do
      it 'displayed error "Last name is required"' do
        fill_client_form(lastName: 'Name', lastName: '')


        expect(page).to have_button('create your account', disabled: true)
        expect(page).to have_content('Last name is required')
        expect(page).to have_no_css('.wizard-wrapper')
        expect(page).to have_css ('.modal-content')

       end
     end
     context 'with last name that contains numbers' do
       it 'displayed error "Last name is invalid"' do
         fill_client_form(lastName: '1lona')

         expect(page).to have_button('create your account', disabled: true)
         expect(page).to have_content('Last name is invalid')
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
