class CreateNotificationSubscription < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.text :event_name
      t.references :subscribeable, polymorphic: true, null: false, index: { name: 'index_notification_subscriptions_on_subscribeable' }
      t.boolean :active
    end
  end
end
