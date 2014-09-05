gem "httpclient"
require "httpclient"

module YandexDictionaryApi

  class ApiClient

    GET_LANGS_HTTP_REQUEST_TMPL = "https://dictionary.yandex.net/api/v1/dicservice.json/getLangs?".freeze
    LOOKUP_HTTP_REQUEST_TMPL = "https://dictionary.yandex.net/api/v1/dicservice.json/lookup?".freeze

    def initialize( api_key )
      @http_client = HTTPClient.new
      @api_key = api_key
    end

    def execute_get_langs
      str_request = self.add_parameters_to_request(GET_LANGS_HTTP_REQUEST_TMPL, Hash.new)
      self.exec_request_http( str_request )
    end

    def execute_lookup( params_hash )
      str_request = self.add_parameters_to_request(LOOKUP_HTTP_REQUEST_TMPL, params_hash)
      self.exec_request_http( str_request )
    end

    protected

    def add_parameters_to_request( str_request, params_hash )
      str_res = str_request + "key=#{@api_key}"
      params_hash.each do |(key, value)|
        str_res += "&#{key}=#{value}"
      end
      str_res
    end

    def exec_request_http( str_request )
      response = @http_client.get( str_request )
      ApiError.check( response )
    end
  end

end