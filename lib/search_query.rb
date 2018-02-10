require "search_query/version"

module SearchQuery

  def self.parse(text)
    text.split(' ').map do |word|
      {
        name: nil,
        value: word,
      }
    end
  end

end
