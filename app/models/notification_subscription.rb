class NotificationSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscribeable, polymorphic: true

  def self.user_has_active_subscription_for?(user:, subscribeable:)
    where(user: user, subscribeable: subscribeable, active: true).exists?
  end
end
