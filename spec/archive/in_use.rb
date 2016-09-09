visit('http://staging.realcar.nyc/fleet')
page.driver.browser.manage.window.resize_to(1500,1500)
click_on ('About')


page.find('div[name=year]').click # choose select
page.find("input[placeholder='Enter a Year']").set('2015') # choose select

 page.find("input[placeholder='Enter a Year']").click('2015')

 select "Enter a Year", :from => "2015"
 find('#Enter a Year').find(:xpath, '2016').select_option
page.select '2015', :from => 'Enter a Year'


find('#side-menu').first(:link, "Clients").click

expect(page).to have_no_selector(:css, 'a[href="http://admin.staging.realcar.nyc/calendar"]')




CLICK ON DIV
find('#accountTitles', :text => 'SIGN IN TO YOUR ACCOUNT').click
