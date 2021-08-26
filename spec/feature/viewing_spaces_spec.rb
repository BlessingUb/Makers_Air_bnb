feature 'Viewing spaces' do
  scenario 'A user can see spaces' do
    # test needs updating - will need to add a user so a user id can be passed
    # the following line isn't feature testing?
    Spaces.create('Blessing Apartment', 'Beautiful three bedroom house', "500")
    visit('/spaces')
    expect(page).to have_content('Blessing Apartment')
    expect(page).to have_content('Beautiful three bedroom house')
    # expect(page).to have_content(500)
  end
end