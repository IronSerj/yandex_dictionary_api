require "spec_helper"

describe YandexDictionaryApi do 

	before do
		$interface = YandexDictionaryApi::ApiInterface.new(ENV['YANDEX_API_KEY'])
	end

	it "should return a list of supported languages" do
		res = $interface.get_langs
		res.include?("en-en")
	end

	it "should return a class contains translation and interpretation of the text" do
		params = { "lang" => "en-ru", "text" => "time" }
		res = $interface.lookup( params )
		res["def"][0]["text"] == "time"
	end 

end