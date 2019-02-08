class Acronym
  def self.abbreviate(words)
    words.split(/\s+|-/)
         .map { |word| word[0] }
         .compact
         .join
         .upcase
  end
end
