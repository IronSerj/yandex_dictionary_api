module YandexDictionaryApi

	class ApiError < StandardError

		def self.check( response )
			case response.code
			when 200
				response
			when 401
				raise ApiError.new("Invalid api key.")
			when 402
				raise ApiError.new("Spicified api key is blocked.")
			when 403
				raise ApiError.new("The daily limit on the number of requests exceeded.")
			when 413
				raise ApiError.new("Limit on the size of text exceeded.")
			when 501
				raise ApiError.new("Spicified direction of translation is not supported.")
			else 
				raise ApiError.new("Try again later.")
			end
		end
	end

end