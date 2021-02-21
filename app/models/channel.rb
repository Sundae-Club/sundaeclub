class Channel < ApplicationRecord
  belongs_to :site
  has_many :videos
  has_many :notification_subscriptions, as: :subscribeable
  validates :site, presence: true
end
