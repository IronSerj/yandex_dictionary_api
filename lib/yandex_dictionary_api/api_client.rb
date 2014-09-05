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
      #str_request = self.add_parameters_to_request(str_request, params_hash)
      self.exec_request_http(str_request, params_hash)
    end

    protected

    def add_parameters_to_request(str_request, params_hash)
      str_res = str_request + "key=#{@api_key}"
      params_hash.each do |(key, value)|
        str_res += "&#{key}=#{value}"
      end
      str_res
    end

    def exec_request_http(str_uri, params_hash)
      @http_client.post(str_uri, params_hash)
    end
  end

end