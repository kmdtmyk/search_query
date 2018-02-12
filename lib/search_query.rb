require "search_query/version"

module SearchQuery

  def self.parse(text)
    return [] if text.nil?
    text.gsub('　', ' ').split(' ').map do |word|
      /((.+)[:：])?(.+)/.match(word)
      name = Regexp.last_match(2)
      value = Regexp.last_match(3)
      {
        name: name,
        value: value,
      }
    end
  end

end
