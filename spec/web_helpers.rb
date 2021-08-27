def create_new_user(name, email, password)
  visit '/'
  click_on 'sign up'
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'submit'
end

def sign_in_as_user(email, password)
  click_on 'login'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'submit'
end

def list_a_space
  click_on 'List a Space'

  fill_in("name", with: 'Apartment')
  fill_in("description", with: 'Beautiful three bed house')
  fill_in("price", with: '500')

  click_on 'List Space'
end