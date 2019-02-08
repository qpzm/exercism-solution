class Acronym
  def self.abbreviate(words)
    words.scan(/\b[a-zA-Z]/)
         .join
         .upcase
  end
end
