feature 'Listing spaces' do
  scenario 'can list space with name, description and price' do
    create_new_user("test", "test@example.com", "p455word")
    list_a_space
    expect(page).to have_content('Apartment')
    expect(page).to have_content('Beautiful three bed house')
    expect(page).to have_content('500')
    click_on 'logout'
  end
end