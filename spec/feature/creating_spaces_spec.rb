feature 'Listing spaces' do
  scenario 'A user can add a space' do
    visit '/spaces'
    click_on 'List a Space'

    fill_in("name", with: 'Blessing Apartment')
    fill_in("des", with: 'Beautiful three bed house')
    fill_in("price", with: '500')

    click_on 'List Space'

    expect(page).to have_content('Blessing Apartment')
    expect(page).to have_content('Beautiful three bed house')
  end
end