feature 'name space' do
  scenario 'should be able to name my space' do
    visit '/space/new'
    fill_in('name', with: 'Blessing Apartment')
    fill_in('description', with: 'Beautiful three bed house')
    fill_in('price', with: 500)
    click_button 'List Space'
  expect(page).to have_content('Blessing Apartment')
  expect(page).to have_content('Beautiful three bed house')
  # expect(page).to have_content(500)
  end
end