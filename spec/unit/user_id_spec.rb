require 'user'

describe User do

  describe '.create' do

    it 'creates a new user object with the required parameters' do
      user = User.create('User', 'Email', 'Passw0rd')
      expect(user.name).to eq "User"
      expect(user.email).to eq "Email"
      expect(user.password).to eq "Passw0rd"
      expect(user.id.to_i).to be_a Integer
    end

  end

end