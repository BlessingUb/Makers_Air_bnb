feature 'standard layout' do
  scenario 'shows the header on the homepage' do
    visit '/'
    expect(page).to have_content 'Makers BnB'

    visit '/login'
    expect(page).to have_content 'Makers BnB'
    
    visit '/signup'
    expect(page).to have_content 'Makers BnB'
  end
end