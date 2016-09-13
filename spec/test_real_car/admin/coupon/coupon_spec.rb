describe 'Coupons', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end

   it 'create coupon' do
    #  login
     visit('https://admin.staging.realcar.nyc/')
      click_link('Coupons')
      click_button('New Coupon')
      fill_in 'couponCode' , with: 'Joker'
      fill_in 'couponDescription' , with: 'Batman Enemy'
      fill_in 'startDate' , with: '2016-08-26'
      fill_in 'endDate' , with: '2017-08-26'
      fill_in 'couponLimit' , with: '5'
      select "$ Amount", :from => "couponType"
      fill_in 'couponAmount' , with: '100'
      click_button('Save')
      sleep 2

      click_link('Coupons')
      sleep 2

      code = page.find('div.ui-grid-cell-contents', text: 'Joker')
      row = code.find(:xpath, "../..")
      row.first('a').click

      expect(page).to have_text("Code: Joker Description: Batman Enemy Valid From: 2016-08-26
      Valid Until: 2017-08-26 Limit: 5 Type: amount Amount: $100.00")
  end

  it 'edit coupon' do
      visit("http://admin.staging.realcar.nyc/coupons/list")
      code = page.find('div.ui-grid-cell-contents', text: 'Joker')
      row = code.find(:xpath, "../..")
      row.first('a').click

      edit = page.find('h3.panel-title')
      edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
      page.find('.glyphicon.glyphicon-remove').click
      edit = page.find('h3.panel-title')
      edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click

      fill_in 'couponCode' , with: 'NewJ'
      fill_in 'couponDescription' , with: 'New Batman Enemy'
      fill_in 'startDate' , with: '2016-12-31'
      fill_in 'endDate' , with: ''
      fill_in 'couponLimit' , with: '765'
      select "% Percentage", :from => "couponType"
      fill_in 'couponAmount' , with: '33'
      click_button('Save')
      sleep 2
      expect(page).to have_text("Code: NewJ Description: New Batman Enemy Valid From: 2016-12-31 Limit: 765 Type: percentage Amount: 33%")
  end

  it 'delete coupon' do
      visit("http://admin.staging.realcar.nyc/coupons/list")
      code = page.find('div.ui-grid-cell-contents', text: 'NewJ')
      row = code.find(:xpath, "../..")
      row.first('a').click

      edit = page.find('h3.panel-title')
      edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
      page.find('.glyphicon.glyphicon-remove').click
      edit = page.find('h3.panel-title')
      edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click

      click_button('Delete')
      sleep 2
      click_button('Yes, delete it!')
      sleep 1
      click_button('OK')
      click_link('Coupons')
      expect(page).to have_no_content ('NewJ')
    end
  end
