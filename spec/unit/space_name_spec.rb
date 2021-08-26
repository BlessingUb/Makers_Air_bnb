require 'space'

describe Space do
  it 'will allow apostrophes in the name' do
    User.create("Bob", "b@b.com", "p@ssw0rD")
    Space.create("Dunrovin'", "Blessing's Apartment", "500", User.current.id)
    expect(Space.current.name).to eq "Dunrovin'"
  end

  it 'will allow hyphens in the name' do
    User.create("Blessing", "b@b.com", "p@ssw0rD")
    Space.create("Dun-roving", "Lovely cottage", "500", User.current.id)
    expect(Space.current.name).to eq "Dun-roving"
  end 
end