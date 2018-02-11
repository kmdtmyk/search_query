require "search_query/version"

module SearchQuery

  def self.parse(text)
    return [] if text.nil?
    text.gsub('　', ' ').split(' ').map do |word|
      {
        name: nil,
        value: word,
      }
    end
  end

end
