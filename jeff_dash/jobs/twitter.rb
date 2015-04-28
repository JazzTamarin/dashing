=begin
    Author:    JazzTamarin, based on spotify example
    Date:      April 27, 2015

    Gets most recent tweets about @Procurify for the twitter_mentions board

=end

require 'twitter'

#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'tQfTPZCD1W9a9yg7lOWjNFn63'
  config.consumer_secret = 'BduEzD5ByYloOx8M6eTJ5Poo6XQfXtt1FMQrNJEHmUJstoqwM9'
  config.access_token = '3171108007-4n80yDXrvvYmUav2TaQm7W2rpmUEXOfIQr02coB'
  config.access_token_secret = 's0FLEiAnvXUKsjg843f79cONFRJrGtj8Z3QPA05inNwgn'
end

search_term = URI::encode('@procurify -rt')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}", result_type: "recent").take(10)

    if tweets
	    #puts "tweet count: " + tweets.size.to_s
      tweets = tweets.map do |tweet|
	       #puts tweet.text
	       #puts "==================================="
         { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  end
end
