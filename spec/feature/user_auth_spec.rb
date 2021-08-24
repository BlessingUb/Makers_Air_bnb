feature 'user authentication process' do
  scenario 'presents the option sign up' do
    visit '/'
    expect(page).to have_content 'sign up or login'
  end

  scenario 'allows a user to create a new account' do
    name, email, password = 'Alice', 'alice@example.com', 'V3ryS3cur3P4ssw0rd'

    create_new_user(name, email, password)

    expect(page).to have_content "Signed in as #{name}"
  end

  scenario 'allows an existing user to log in' do
    name, email, password = 'Bob', 'bob@example.com', 'V3ryS3cur3P4ssw0rd'

    create_new_user(name, email, password)
    click_on 'logout'
    sign_in_as_user(email, password)

    expect(page).to have_content "Signed in as #{name}"
  end

  scenario 'allows a signed in user to log out' do
    name, email, password = 'Carlos', 'carlos@example.com', 'V3ryS3cur3P4ssw0rd'

    create_new_user(name, email, password)
    click_on 'logout'
    sign_in_as_user(email, password)
    click_on 'logout'
    
    expect(page).to have_content "sign up or login"
  end
end
