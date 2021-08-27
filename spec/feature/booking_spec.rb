feature 'booking' do
  scenario 'shows signed up users the option to make a booking' do
    visit '/spaces'
    expect(page).to have_content 'Book this space'
  end

  scenario 'allows a user to make a booking' do
    create_new_user('User', 'user@example.com', 'P455w0rd')
    # I'm aware the following lines do not belong in a feature test
    Space.create('Home 1', 'Beautiful three bedroom house', '500', User.current.id)

    visit "/booking/new/#{Space.current.id}"
    expect(page).to have_content "Book #{Space.current.name}"
  end
end