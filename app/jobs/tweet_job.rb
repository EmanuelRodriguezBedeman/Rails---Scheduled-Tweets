class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # Checks if the tweet is already published
    return if tweet.publish?

    # Checks if the time to publish the tweet has not expired yet
    return if tweet.publish_at > Time.current
    
    tweet.publish_to_twitter!
  end
end