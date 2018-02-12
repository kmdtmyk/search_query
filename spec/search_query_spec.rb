RSpec.describe SearchQuery do

  it 'has a version number' do
    expect(SearchQuery::VERSION).not_to be nil
  end

  describe '#parse' do

    describe 'data' do

      it 'text' do
        expect(SearchQuery.parse('foo').first).to eq({
          name: nil,
          value: 'foo',
        })
      end

      it 'text with name' do
        expect(SearchQuery.parse('type:foo').first).to eq({
          name: 'type',
          value: 'foo',
        })
      end

      it 'text with name (full-width colon)' do
        expect(SearchQuery.parse('タイプ：foo').first).to eq({
          name: 'タイプ',
          value: 'foo',
        })
      end

    end

    describe 'length' do

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
