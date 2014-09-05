module YandexDictionaryApi
  
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

    def recognize_translation(array)
      array.each do |hash|
        read_hash(hash)
      end
    end

    protected

    def read_hash(hash)
      hash.each_pair do |key, value|
        unless value.is_a? Array
          @translations << value << " "
        else
          case key
          when "syn"
            @synonyms << read_attr_string(value)
          when "mean"
            @means << read_attr_string(value)
          when "ex"
            @examples << read_attr_string(value)
          end
        end
      end
    end

    def read_attr_string(list)
      str_res = ""
      if list.is_a? Array
        list.each do |hash|
          str_res << read_attr_string(hash)
        end
        return str_res
      end
      list.each_pair do |key, value|
        if value.is_a? Array
          str_res << read_attr_string(value)
        else
          str_res << "#{value}" << " "
        end
      end
      str_res
    end

  end
end
