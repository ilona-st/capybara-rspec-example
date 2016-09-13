module AuthenticationMacros
  def login
    visit('http://admin.staging.realcar.nyc/')
    page.find_field('email').set('admin@realcar.com')
    page.find_field('password').set('123123123')
    click_button('Login')
  end
end
