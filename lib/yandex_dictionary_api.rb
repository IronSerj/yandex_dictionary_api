require "yandex_dictionary_api/version"
require "yandex_dictionary_api/api_client"
require "yandex_dictionary_api/api_error"
require "yandex_dictionary_api/article"
require "json"

module YandexDictionaryApi

  class ApiInterface

    def initialize(api_key)
      @client = YandexDictionaryApi::ApiClient.new(api_key)
    end

    #Executes getLangs (list of supported languages) request to YandexDictionaryApi api
    def get_langs
      response = @client.execute("getLangs", Hash.new)
      self.check_response(response)
      JSON.parse(response.body)
    end

    # Executes lookup (Interpretation and translate) request to yandex dictionary api 
    # Returns Json object (see Readme example).
    def lookup(params_hash)
      response = exec_lookup(params_hash)
      JSON.parse(response.body)
    end

    # Executes lookup (Interpretation and translate) request to yandex dictionary api 
    # Returns Array of Articles (see Readme example).
    def lookup_arr(params_hash)
      response = exec_lookup(params_hash)
      read_lookup_response(JSON.parse(response.body))
    end

    protected

    def exec_lookup(params_hash)
      response = @client.execute("lookup", params_hash)
      self.check_response(response)
    end

    def check_response(response)
      case response.code
      when 200
        response
      when 401
        raise ApiError.new(response.code, "Invalid api key.")
      when 402
        raise ApiError.new(response.code, "Spicified api key is blocked.")
      when 403
        raise ApiError.new(response.code, "The daily limit on the number of requests exceeded.")
      when 413
        raise ApiError.new(response.code, "Limit on the size of text exceeded.")
      when 501
        raise ApiError.new(response.code, "Spicified direction of translation is not supported.")
      else 
        raise ApiError.new(response.code, "Try again later.")
      end
    end

    def read_lookup_response(hash)
      res = Array.new
      hash["def"].each do |hash|
        res << Article::recognize_article(hash)
      end
      res
    end

  end
end