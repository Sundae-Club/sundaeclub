class NotificationSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscribeable, polymorphic: true
end
