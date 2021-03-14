class NotificationSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscribeable, polymorphic: true

  after_create_commit :broadcast

  def self.user_has_active_subscription_for?(user:, subscribeable:)
    where(user: user, subscribeable: subscribeable, active: true).exists?
  end

  private

  def broadcast
    broadcast_prepend_to [user, subscribeable], :notification_subscriptions
  end
end
