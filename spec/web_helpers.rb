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