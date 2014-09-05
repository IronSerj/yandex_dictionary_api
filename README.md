# YandexDictionaryApi

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yandex_dictionary_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_dictionary_api

## Exapmle

    i = YandexDictionaryApi::ApiInterface.new("<your_api_key>")
    i.get_langs
    params = { "lang" => "en-ru", "text" => "time" }
    i.lookup( params )
    articles = i.lookup_arr( params )
    articles.each do |article|
    	article.text
	    article.translations
	    article.synonyms
	    article.means
	    article.examples
    end

## Return

ApiInterface returns classes, created by JSON parser. 
In case of the bad response from server raises ApiError with suitable message.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/yandex_dictionary_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
