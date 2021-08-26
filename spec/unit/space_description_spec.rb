require 'space'

describe Space do

  it 'will allow apostrophes in the description' do
    User.create("Blessing", "b@b.com", "p@ssw0rD")
    Space.create("Name", "Blessing's Apartment", "500", User.current.id)
    expect(Space.current.description).to eq "Blessing's Apartment"
  end

  it 'will allow random characters in description' do
    User.create("Blessing", "b@b.com", "p@ssw0rD")
    Space.create("Name", "@€£#$%^&*()_={}[]|:<>.,", "500", User.current.id)
    expect(Space.current.description).to eq "@€£#$%^&*()_={}[]|:<>.,"
  end
  
end
