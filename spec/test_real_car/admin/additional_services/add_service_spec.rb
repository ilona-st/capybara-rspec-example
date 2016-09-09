describe 'Additional Services', type: :feature do
  before  do
    page.driver.browser.manage.window.maximize
  end

  it 'create service' do

    visit('http://admin.staging.realcar.nyc/')
    page.find_field('email').set('admin@realcar.com')
    page.find_field('password').set('123123123')
    click_button('Login')

    sleep 1
    find('#side-menu').first(:link, "Additional Services").click
    page.find(:css, '.btn.btn-default.btn-warning.new-instance-button').click

    fill_in 'serviceTitle', with: 'New awesome service'
    fill_in 'servicePrice', with: '100'
    fill_in 'shortName', with: 'short awesome name'
    fill_in 'servicePosition', with: '1'

    mycheckbox = page.all(".form-checkbox-wrapper")
    expect(mycheckbox.size).to eq 3

    # mycheckbox.first.click
    mycheckbox[0].click
    mycheckbox[1].click
    mycheckbox[2].click
    # mycheckbox.last.click

    fill_in 'contractPrice', with: '665'
    click_button("Save")
    click_link("New awesome service")

    expect(page).to have_text("    Title: New awesome service
        Short name: short awesome name
        Price: $100.00
        Position: 1
        Insurance: +
        CDW: +
        CDW coverage: 665
        GTW: +")

  end

  it 'edit service' do

    visit('http://admin.staging.realcar.nyc/services/list')
    click_link("New awesome service")
    edit = page.find('h3.panel-title')
    edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
    page.find('.glyphicon.glyphicon-remove').click
    edit = page.find('h3.panel-title')
    edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click

    expect(page).to have_text("Title: New awesome service Short name: short awesome name Price: $100.00 Position: 1 Insurance: + CDW: + CDW coverage: 665 GTW: + Edit Addition Service Cancel Edit Addition Service (Esc) Title Price $ Short Name Position Is Insurance Is GTW Is CDW CDW coverage Delete Save")

    fill_in 'serviceTitle', with: 'Awesome service'
    fill_in 'servicePrice', with: '777'
    fill_in 'shortName', with: 'aw_name'
    fill_in 'servicePosition', with: '-1'

    mycheckbox = page.all(".form-checkbox-wrapper")
    expect(mycheckbox.size).to eq 3

    # mycheckbox.first.click
    mycheckbox[0].click
    mycheckbox[1].click
    # mycheckbox.last.click

    click_button("Save")
    sleep 3
    visit('http://admin.staging.realcar.nyc/services/list')
    click_link("Awesome service")

    expect(page).to have_text("Title: Awesome service Short name: aw_name Price: $777.00 Position: -1 Insurance: - CDW: + CDW coverage: 665 GTW: -")

end

  it 'delete service' do
    visit('http://admin.staging.realcar.nyc/services/list')
    click_link("Awesome service")
    edit = page.find('h3.panel-title')
    edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
    page.find('.glyphicon.glyphicon-remove').click
    edit = page.find('h3.panel-title')
    edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click

    expect(page).to have_text("Title: Awesome service Short name: aw_name Price: $777.00 Position: -1 Insurance: - CDW: + CDW coverage: 665 GTW: -")

    click_button('Delete')
    sleep 2

    click_button('Yes, delete it!')
    sleep 1
    click_button('OK')

    expect(page).to have_no_text("Awesome service")
  end

    it "check validation" do
      visit('https://admin.staging.realcar.nyc/services/list')
      edit = page.find('h3.panel-title')
      edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
      click_button("Save")

      val = ('.additionServiceFormCtrl.isErrorClass')
      expect(val).to have_text("Service title is required.")
    end
end
