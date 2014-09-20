module YandexDictionaryApi
  TEXT = 1.freeze
  TRANSLATIONS = 2.freeze
  SYNONYMS = 3.freeze
  MEANS = 4.freeze
  EXAMPLES = 5.freeze

  # Includes containing of interpretation article, that returns lookup request
  class Article
    attr_accessor :text
    attr_accessor :translations
    attr_accessor :synonyms
    attr_accessor :means
    attr_accessor :examples

    def initialize()
      @text = ""
      @translations = ""
      @synonyms = ""
      @means = ""
      @examples = ""
    end

    def self.recognize_article(hash)
      res = Article.new
      res.read_hash(hash, TEXT)
      res
    end

    def read_hash(hash, data_kind)
      hash.each_pair do |key, value|
        unless value.is_a? Array
          txt = value + " "
          case data_kind
          when TEXT
            @text << txt
          when TRANSLATIONS
            @translations << txt
          when SYNONYMS
            @synonyms << txt
          when MEANS
            @means << txt
          when EXAMPLES
            @examples << txt
          end
        else
          case key
          when "tr"
            read_array(value, TRANSLATIONS)
          when "syn"
            read_array(value, SYNONYMS)
          when "mean"
            read_array(value, MEANS)
          when "ex"
            read_array(value, EXAMPLES)
          end
        end
      end
    end

    protected

    def read_array(array, data_kind)
      array.each do |hash|
        read_hash(hash, data_kind)
      end
    end

  end
end
