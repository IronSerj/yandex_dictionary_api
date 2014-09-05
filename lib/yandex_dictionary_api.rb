require "yandex_dictionary_api/version"
require "yandex_dictionary_api/api_client"
require "yandex_dictionary_api/api_error"
require "json"

module YandexDictionaryApi

  class ApiInterface

    def initialize( api_key )
      @client = YandexDictionaryApi::ApiClient.new( api_key )
    end

    #Executes getLangs (list of supported languages) request to YandexDictionaryApi api
    def get_langs
      response = @client.execute_get_langs
      JSON.parse( response.body )
    end

    #Executes lookup (Interpretation and translate) request to yandex dictionary api 
    def lookup( params_hash )
      response = @client.execute_lookup( params_hash )
      JSON.parse( response.body )
    end
  end
end