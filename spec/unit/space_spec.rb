require 'space'

describe Space do
  describe '.all' do
    it 'returns all spaces' do
      User.create("john", "john@email.com", "Password")
      Space.create('Blessing Apartment', 'Beautiful three bedroom house', "500", User.current.id)
      Space.create('Blessing Apartment 2', 'Beautiful four bedroom house', "600", User.current.id)
      spaces = Space.all
      expect(spaces.length).to eq 2
      expect(spaces.first).to be_a Space
      expect(spaces.first.name).to eq 'Blessing Apartment'
      expect(spaces.last.name).to eq 'Blessing Apartment 2'
      expect(spaces.first.description).to eq 'Beautiful three bedroom house'
      expect(spaces.last.price).to eq '600'
    end
  end

  describe '.create' do
    it 'creates a new space object with required parameters' do
      User.create("john", "john@email.com", "Password")
      spaces = Space.create('Tosin Bed & Breakfast', 'Beautiful all in one house', '300', User.current.id)
      expect(spaces).to be_a Space
      expect(spaces.name).to eq 'Tosin Bed & Breakfast'
      expect(spaces.description).to eq 'Beautiful all in one house'
      expect(spaces.price).to eq '300'
      expect(spaces.id.to_i).to be_a Integer
    end
  end

  describe '.current' do
    it 'returns the current instance of space class' do
      user = User.create("john", "john@email.com", "Password")
      expect(User.current.name).to eq 'john' 
    end
  end

end