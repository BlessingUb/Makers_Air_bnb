require 'pg'

describe DBConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

      DBConnection.setup('makersbnb_test')
    end
  end

  it 'runs a query' do  
    expect(DBConnection.query("SELECT 1").class).to eq PG::Result
  end
end