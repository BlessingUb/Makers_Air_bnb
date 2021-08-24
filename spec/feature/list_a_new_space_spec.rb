feature 'listing a new space' do

  scenario 'can click button on homepage to list new space' do
    visit '/'
    click_button 'List Space'
    expect(page).to have_current_path('/space/new')
    expect(page).to have_content 'List a new space'
  end

end