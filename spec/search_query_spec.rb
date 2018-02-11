RSpec.describe SearchQuery do

  it 'has a version number' do
    expect(SearchQuery::VERSION).not_to be nil
  end

  describe 'parse' do

    describe 'result length' do

      it 'nil' do
        expect(SearchQuery.parse(nil).length).to eq(0)
      end

      it 'blank' do
        expect(SearchQuery.parse('').length).to eq(0)
      end

      it 'one word' do
        expect(SearchQuery.parse('foo').length).to eq(1)
      end

      describe 'two words' do

        it 'separated by space' do
          expect(SearchQuery.parse('foo bar').length).to eq(2)
        end

        it 'separated by double-byte space' do
          expect(SearchQuery.parse('foo　bar').length).to eq(2)
        end

        it 'separated by tab' do
          expect(SearchQuery.parse("foo\tbar").length).to eq(2)
        end

        it 'separated by consective space' do
          expect(SearchQuery.parse('foo  bar').length).to eq(2)
        end

      end

    end

  end

end
