feature 'Sooking' do
  scenario 'shows signed up users the option to make a booking' do
    # create_new_user('user', 'user@example.com', 'V3ryS3cur3P4ssw0rd')
    # sign_in_as_user('user', 'V3ryS3cur3P4ssw0rd')
    visit '/spaces'
    expect(page).to have_content 'Book this space'
  end

  scenario 'allows a user to make a booking' do
    
  end
end