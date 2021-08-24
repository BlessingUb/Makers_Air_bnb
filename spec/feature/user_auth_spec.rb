feature 'user authentication process' do
  scenario 'presents the option sign up' do
    visit '/'
    expect(page).to have_content 'sign up'
  end

  scenario 'allows a user to create a new account' do
    visit '/'
    click_on 'sign up'
    fill_in 'name', with: 'Alice'
    fill_in 'email', with: 'alice@example.com'
    fill_in 'password', with: 'V3ryS3cur3P4ssw0rd'
    click_on 'submit'
    expect(page).to have_content "Signed in as Alice"
  end
end