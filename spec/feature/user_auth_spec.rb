feature 'user authentication process' do
  scenario 'presents the option sign up' do
    visit '/'
    expect(page).to have_content 'sign up or login'
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

  scenario 'allows an existing user to log in' do
    visit '/'
    click_on 'sign up'
    fill_in 'name', with: 'Alice'
    fill_in 'email', with: 'alice@example.com'
    fill_in 'password', with: 'V3ryS3cur3P4ssw0rd'
    click_on 'submit'
    click_on 'logout'
    click_on 'login'
    fill_in 'email', with: 'alice@example.com'
    fill_in 'password', with: 'V3ryS3cur3P4ssw0rd'
    click_on 'submit'
    expect(page).to have_content "Signed in as Alice"
  end

  scenario 'allows a signed in user to log out' do
    visit '/'
    click_on 'sign up'
    fill_in 'name', with: 'Alice'
    fill_in 'email', with: 'alice@example.com'
    fill_in 'password', with: 'V3ryS3cur3P4ssw0rd'
    click_on 'submit'
    click_on 'logout'
    expect(page).to have_content "sign up or login"
  end
end