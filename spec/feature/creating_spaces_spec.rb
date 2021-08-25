feature 'Listing spaces' do
  scenario 'A user can add a space' do
    visit '/'
    click_button 'List a Space'

    # fill_in("name", with: 'Blessing Apartment')
    # fill_in("des", with: 'Beautiful three bed house')
    # fill_in("price", with: '500')

    p page

    find('name').set('Blessing Apartment')
    find('des').set('Beautiful three bed house')
    find('price').set('500')

    expect(page).to have_content('Blessing Apartment')
    expect(page).to have_content('Beautiful three bed house')
  end
end