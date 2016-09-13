describe 'Pricing Rules', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end

context 'Regular Rule' do
   it 'create and delete' do
      visit('https://admin.staging.realcar.nyc/')
      login
      click_link 'Pricing'
      click_button 'New Pricing Rule'
      choose 'Regular'
      page.find("input[ng-model='pricingRule.startDate']").set('09/21/2016')

      fill_in 'priority' , with: '1'
      fill_in 'wdAmount' , with: '149'
      fill_in 'wkndAmount' , with: '179'
      fill_in 'dayPerWeekAmount' , with: '129'
      fill_in 'dayAmount' , with: '99'
      click_button 'Create'
      sleep 1
      expect(page).to have_text("Type: regular From 09/21/2016 Priority: 1")
      expect(page).to have_text("Per Day In Work Days: $149.00 In Week End: $179.00")
      expect(page).to have_text("Per Week $129.00")
      expect(page).to have_text("Per Month $99.00")

      click_edit
      click_delete
      sleep 1
   end
end

context 'Specific Rule' do
   it 'create and delete' do
      visit('https://admin.staging.realcar.nyc/')

      click_link 'Pricing'
      click_button 'New Pricing Rule'
      choose 'Specific'
      sleep 1
      fill_in 'startDate' , with: '09/21/2016'
      fill_in 'endDate' , with: '11/12/2017'
      fill_in 'priority' , with: '1'
      fill_in 'perDayAmount' , with: '129'
      click_button 'Create'
      sleep 1

      expect(page).to have_text("Type: specific")
      expect(page).to have_text("From 09/21/2016")
      expect(page).to have_text("to 11/12/2017")
      expect(page).to have_text("Priority: 1 Broken: no")
      expect(page).to have_text("Per Day $129.00")

      click_edit
      click_delete
      sleep 1
    end
  end
end
