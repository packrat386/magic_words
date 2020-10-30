module MagicWords
  module Dict
    def self.from_list(name, words)
      const_set(
        name.upcase,
        Module.new do
          words.map(&:strip).each do |word|
            next unless /^[A-Za-z]*$/.match?(word)

            const_set(word.upcase, word.downcase) unless const_defined?(word.upcase)
          end
        end
      )
    end

    def self.from_file(name, filename)
      from_list(name, File.readlines(filename))
    end
  end
end
