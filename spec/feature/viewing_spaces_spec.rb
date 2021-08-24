feature 'Viewing spaces' do
  scenario 'A user can see spaces' do
    Spaces.create(name: 'Blessing Apartment', des: 'Beautiful three bedroom house', price: "500")
    visit('/spaces')
    expect(page).to have_content('Blessing Apartment')
    expect(page).to have_content('Beautiful three bedroom house')
    # expect(page).to have_content(500)
  end
end