require "httpclient"

module YandexDictionaryApi

  class ApiClient

    BASE_URI = "https://dictionary.yandex.net/api/v1/dicservice.json"

    def initialize(api_key)
      @http_client = HTTPClient.new
      @api_key = api_key
    end

    def execute(str_req_type, params_hash)
      str_request = BASE_URI + "/#{str_req_type}?"
      params_hash["key"] = @api_key
      self.exec_request_http(str_request, params_hash)
    end

    protected

    def exec_request_http(str_uri, params_hash)
      @http_client.post(str_uri, params_hash)
    end
  end

end