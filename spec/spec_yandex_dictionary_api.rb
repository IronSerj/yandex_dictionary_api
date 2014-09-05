require "spec_helper"

describe YandexDictionaryApi do 

  before do
    $interface = YandexDictionaryApi::ApiInterface.new("dict.1.1.20140904T085142Z.bc794363dea5e8da.bcafbef2c018fc447d8de5c67ff8e2dd7f57481f") #ENV["KEY"])
  end

  it "should return a list of supported languages" do
    res = $interface.get_langs
    res.include?("en-en")
  end

  it "should return a class contains translation and interpretation of the text" do
    params = { "lang" => "en-ru", "text" => "time" }
    res = $interface.lookup(params)
    res["def"][0]["text"] == "time"
  end

  it "should return an array of instances Article class" do
    params = { "lang" => "en-ru", "text" => "time" }
    articles = $interface.lookup_arr( params )
    articles.each do |article|
      puts article.text
      puts article.translations
      puts article.synonyms
      puts article.means
      puts article.examples
    end
    true
  end

end