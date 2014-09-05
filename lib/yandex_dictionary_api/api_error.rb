module YandexDictionaryApi

  class ApiError < StandardError

    attr_reader :code

    def initialize(int_code, str_message)
      @code = int_code
      msg = "Response code: #{int_code}. " + str_message
      super(msg)
    end
  end
end