module AuthenticationMacros
  def login
    visit('http://admin.staging.realcar.nyc/')
    page.find_field('email').set('admin@realcar.com')
    page.find_field('password').set('123123123')
    click_button('Login')
  end
end


# module MainMenuLinks
#   def visit_additional_services_page
#     visit('https://admin.staging.realcar.nyc/services/list')
#   end
# end
