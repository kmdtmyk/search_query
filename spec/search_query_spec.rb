RSpec.describe SearchQuery do

  it 'has a version number' do
    expect(SearchQuery::VERSION).not_to be nil
  end

  describe 'parse' do

    it 'one word' do
      expect(SearchQuery.parse('foo')).to eq([
        {
          name: nil,
          value: 'foo'
        },
      ])
    end

    it 'two words' do
      expect(SearchQuery.parse('foo bar')).to eq([
        {
          name: nil,
          value: 'foo'
        },
        {
          name: nil,
          value: 'bar'
        },
      ])
    end

  end

end
