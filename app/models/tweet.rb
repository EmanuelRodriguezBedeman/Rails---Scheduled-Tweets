class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  # Validation for all the fields:

  # -> For the length of the text
  validates :body, length: { minimum: 1, maximun: 280 }

  # -> For the date to publish to be always present
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 1.hour.from_now
  end

  after_save_commit do
    if publish_at_previously_changed?
        TweetJob.set(wait_until: publish_at).perform_later(self)
    end
  end

  # To determine if the tweet was published or not.
  def published?
    # Checks if there is a tweet id saved, returns true or false
    tweet_id? 
  end

  def publish_to_twitter!
    tweet = twitter_account.client.update(body)
    update(tweet_id: tweet.id)
  end
end