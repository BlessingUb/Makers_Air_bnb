feature 'booking' do
  scenario 'shows signed up users the option to make a booking' do
    create_new_user('User', 'user@example.com', 'P455w0rd')
    list_a_space
    expect(page).to have_content 'Apartment'    
    expect(page).to have_content 'Book this space'
    click_on 'logout'
  end

  scenario 'allows a user to make a booking' do
    create_new_user('User', 'user@example.com', 'P455w0rd')
    list_a_space
    click_on 'logout'
    create_new_user('User2', 'user2@example.com', 'P455w0rd')
    expect(page).to have_content "Apartment"
    expect(page).to have_content "Book this space"
    click_on 'logout'
  end
end