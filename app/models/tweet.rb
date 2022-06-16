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
end