require 'spaces'

describe Spaces do
  
  it "check if space include the user id" do
    User.create("john", "john@email.com", "Password")
    user = User.current
    space = Spaces.create("MakersBnb", "comfortable", 250, user.id)
    expect(space.user_id).to eq user.id

  end

end