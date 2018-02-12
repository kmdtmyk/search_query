require "search_query/version"

module SearchQuery

  def self.parse(text)
    return [] if text.nil?
    text.gsub('　', ' ').split.map do |word|
      match = /((?<name>.+)[:：])?(?<value>.+)/.match(word)
      name = match[:name]
      value = match[:value]
      {
        name: name,
        value: value,
      }
    end
  end

end
