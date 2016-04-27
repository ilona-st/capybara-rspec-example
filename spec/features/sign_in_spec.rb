describe 'sign in process', type: :feature do
  it 'sign in' do
    visit('http://www.vk.com')
    fill_in('quick_email', with: '380637130481')
    fill_in('quick_pass', with: '123123123')
    click_on 'Log in'
    find(:xpath, "//a[@href='/ynnni' and @class='left_row']").click
    click_on 'profile_photo_link'
    find(:xpath, "//div[@id='pv_like']").click

    find(:xpath, "//div[@id='reply_field179891330_photo405519157']").click
    find(:xpath, "//div[@id='reply_field179891330_photo405519157']").set 'Capybara'
    click_on 'Post'
  end
end
