module EditdeleteMacros
  def click_edit
    edit = page.find('h3.panel-title')
    edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
    page.find('.glyphicon.glyphicon-remove').click
    edit = page.find('h3.panel-title')
    edit.find('.glyphicon.glyphicon-edit.pull-right.pointer').click
  end

  def click_delete
    click_button('Delete')
    sleep 1
    click_button('Yes, delete it!')
    expect(page).to have_text('Deleted!')
    sleep 1
    click_button('OK')
  end
end
