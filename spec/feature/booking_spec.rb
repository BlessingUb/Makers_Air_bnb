feature 'booking' do
  scenario 'shows signed up users the option to make a booking' do
    create_new_user('User', 'user@example.com', 'P455w0rd')
    Space.create('Home 1', 'Beautiful three bedroom house', '500', User.current.id)
    visit '/spaces'
    expect(page).to have_content 'Book this space'
  end

  scenario 'allows a user to make a booking' do
    User.create('User', 'user@example.com', 'P455w0rd')
    Space.create('Home 1', 'Beautiful three bedroom house', '500', User.current.id)
    User.create('User2', 'user2@example.com', 'P455w0rd')

    visit "/booking/new/#{Space.current.id}"
    expect(page).to have_content "Book #{Space.current.name}"
  end
end