describe 'Pricing Rules', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end

context 'Regular Rule' do
   it 'create' do
     visit('https://admin.staging.realcar.nyc/')
     login

     click_link('Pricing')
     click_button('New Pricing Rule')
     choose('Regular')
    #  fill_in '' , with: ''


      page.find("input[ng-model='pricingRule.startDate']").set('09/21/2016')

      fill_in 'priority' , with: '1'
      fill_in 'wdAmount' , with: '149'
      fill_in 'wkndAmount' , with: '179'
      fill_in 'dayPerWeekAmount' , with: '129'
      fill_in 'dayAmount' , with: '99'
      # expect(page).to have_text("Start Date 09/21/2016 Priority 1 Per Day WD $ 149 WKND $ 179 Description Per Week WD $ 129 W $ 903 Description Per Month MD $ 99 M $ 2970")

      click_button('Create')
      expect(page).to have_text("")

      click_edit
      click_delete

     sleep 4

  end
  #
  # it 'edit' do
  #
  # end
  #
  # it 'delete' do
  #
  #   end
  # end
  #
  # context 'Specific Rule'
  #    it 'create' do
  #
  #      visit('https://admin.staging.realcar.nyc/')
  #     click_link('Pricing')
      #  click_button('New Pricing Rule')
      #  choose('Specific')
      #  sleep 4
  #   end
  #
  #   it 'edit' do
  #
  #   end
  #
  #   it 'delete' do
  #
  #     end
    end
  end
