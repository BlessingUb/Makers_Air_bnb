feature 'standard layout' do
  scenario 'shows the header on each page' do
    visit '/'
    expect(page).to have_content 'Makers BnB'
  end
end